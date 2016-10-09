(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';

/**
 * @class dE00
 * @classdesc
 * The CIE2000 color difference algorithm.
 * http://en.wikipedia.org/wiki/Color_difference#CIEDE2000
 * @constructs dE00
 * @memberOf DeltaE
 * @property {object} x1 The LAB color configuration object.
 * @property {number} x1.L The lightness value, on scale of 0-100.
 * @property {number} x1.A The chroma value, on scale of -128 to 128.
 * @property {number} x1.B The hue value, on scale of -128 to 128.
 * @property {object} x2 The LAB color configuration object.
 * @property {number} x2.L The lightness value, on scale of 0-100.
 * @property {number} x2.A The chroma value, on scale of -128 to 128.
 * @property {number} x2.B The hue value, on scale of -128 to 128.
 * @property {object} weights The weights configuration object.
 * @property {number} weights.lightness A weight factor to apply to lightness.
 * @property {number} weights.chroma A weight factor to apply to chroma.
 * @property {number} weights.hue A weight factor to apply to hue.
 * @example
 * var deltaE = new dE00(
 *     {L:50, A:50, B:50},
 *     {L:100, A:50, B:50},
 * );
 * console.log(deltaE.getDeltaE());
 */
function dE00(x1, x2, weights) {
    var sqrt = Math.sqrt;
    var pow = Math.pow;
    
    this.x1 = x1;
    this.x2 = x2;
    
    this.weights = weights || {};
    this.ksubL = this.weights.lightness || 1;
    this.ksubC = this.weights.chroma || 1;
    this.ksubH = this.weights.hue || 1;
    
    // Delta L Prime
    this.deltaLPrime = x2.L - x1.L;
    
    // L Bar
    this.LBar = (x1.L + x2.L) / 2;
    
    // C1 & C2
    this.C1 = sqrt(pow(x1.A, 2) + pow(x1.B, 2));
    this.C2 = sqrt(pow(x2.A, 2) + pow(x2.B, 2));
    
    // C Bar
    this.CBar = (this.C1 + this.C2) / 2;
    
    // A Prime 1
    this.aPrime1 = x1.A +
        (x1.A / 2) *
        (1 - sqrt(
            pow(this.CBar, 7) /
            (pow(this.CBar, 7) + pow(25, 7))
        ));

    // A Prime 2
    this.aPrime2 = x2.A +
        (x2.A / 2) *
        (1 - sqrt(
            pow(this.CBar, 7) /
            (pow(this.CBar, 7) + pow(25, 7))
        ));

    // C Prime 1
    this.CPrime1 = sqrt(
        pow(this.aPrime1, 2) +
        pow(x1.B, 2)
    );
    
    // C Prime 2
    this.CPrime2 = sqrt(
        pow(this.aPrime2, 2) +
        pow(x2.B, 2)
    );
    
    // C Bar Prime
    this.CBarPrime = (this.CPrime1 + this.CPrime2) / 2;
    
    // Delta C Prime
    this.deltaCPrime = this.CPrime2 - this.CPrime1;
    
    // S sub L
    this.SsubL = 1 + (
        (0.015 * pow(this.LBar - 50, 2)) /
        sqrt(20 + pow(this.LBar - 50, 2))
    );
    
    // S sub C
    this.SsubC = 1 + 0.045 * this.CBarPrime;
    
    /**
     * Properties set in getDeltaE method, for access to convenience functions
     */
    // h Prime 1
    this.hPrime1 = 0;
    
    // h Prime 2
    this.hPrime2 = 0;
    
    // Delta h Prime
    this.deltahPrime = 0;
    
    // Delta H Prime
    this.deltaHPrime = 0;
    
    // H Bar Prime
    this.HBarPrime = 0;
    
    // T
    this.T = 0;
    
    // S sub H
    this.SsubH = 0;
    
    // R sub T
    this.RsubT = 0;
}

/**
 * Returns the deltaE value.
 * @method
 * @returns {number}
 */
dE00.prototype.getDeltaE = function() {
    var sqrt = Math.sqrt;
    var sin = Math.sin;
    var pow = Math.pow;
    
    // h Prime 1
    this.hPrime1 = this.gethPrime1();
    
    // h Prime 2
    this.hPrime2 = this.gethPrime2();
    
    // Delta h Prime
    this.deltahPrime = this.getDeltahPrime();
    
    // Delta H Prime
    this.deltaHPrime = 2 * sqrt(this.CPrime1 * this.CPrime2) * sin(this.degreesToRadians(this.deltahPrime) / 2);
    
    // H Bar Prime
    this.HBarPrime = this.getHBarPrime();
    
    // T
    this.T = this.getT();
    
    // S sub H
    this.SsubH = 1 + 0.015 * this.CBarPrime * this.T;
    
    // R sub T
    this.RsubT = this.getRsubT();
    
    // Put it all together!
    var lightness = this.deltaLPrime / (this.ksubL * this.SsubL);
    var chroma = this.deltaCPrime / (this.ksubC * this.SsubC);
    var hue = this.deltaHPrime / (this.ksubH * this.SsubH);
   
    return sqrt(
        pow(lightness, 2) +
        pow(chroma, 2) +
        pow(hue, 2) +
        this.RsubT * chroma * hue
    );
};

/**
 * Returns the RT variable calculation.
 * @method
 * @returns {number}
 */
dE00.prototype.getRsubT = function() {
    var sin = Math.sin;
    var sqrt = Math.sqrt;
    var pow = Math.pow;
    var exp = Math.exp;
    
    return -2 *
        sqrt(
            pow(this.CBarPrime, 7) /
            (pow(this.CBarPrime, 7) + pow(25, 7))
        ) *
        sin(this.degreesToRadians(
            60 *
            exp(
                -(
                    pow(
                        (this.HBarPrime - 275) / 25, 2
                    )
                )
            )
        ));
};

/**
 * Returns the T variable calculation.
 * @method
 * @returns {number}
 */
dE00.prototype.getT = function() {
    var cos = Math.cos;
    
    return 1 -
        0.17 * cos(this.degreesToRadians(this.HBarPrime - 30)) +
        0.24 * cos(this.degreesToRadians(2 * this.HBarPrime)) +
        0.32 * cos(this.degreesToRadians(3 * this.HBarPrime + 6)) -
        0.20 * cos(this.degreesToRadians(4 * this.HBarPrime - 63));
};

/**
 * Returns the H Bar Prime variable calculation.
 * @method
 * @returns {number}
 */
dE00.prototype.getHBarPrime= function() {
    var abs = Math.abs;
    
    if (abs(this.hPrime1 - this.hPrime2) > 180) {
        return (this.hPrime1 + this.hPrime2 + 360) / 2
    }
    
    return (this.hPrime1 + this.hPrime2) / 2
};

/**
 * Returns the Delta h Prime variable calculation.
 * @method
 * @returns {number}
 */
dE00.prototype.getDeltahPrime = function() {
    var abs = Math.abs;
    
    // When either C′1 or C′2 is zero, then Δh′ is irrelevant and may be set to
    // zero.
    if (0 === this.C1 || 0 === this.C2) {
        return 0;
    }
    
    if (abs(this.hPrime1 - this.hPrime2) <= 180) {
        return this.hPrime2 - this.hPrime1;
    }
    
    if (this.hPrime2 <= this.hPrime1) {
        return this.hPrime2 - this.hPrime1 + 360;
    } else {
        return this.hPrime2 - this.hPrime1 - 360;
    }
};

/**
 * Returns the h Prime 1 variable calculation.
 * @method
 * @returns {number}
 */
dE00.prototype.gethPrime1 = function() {
    return this._gethPrimeFn(this.x1.B, this.aPrime1);
};

/**
 * Returns the h Prime 2 variable calculation.
 * @method
 * @returns {number}
 */
dE00.prototype.gethPrime2 = function() {
    return this._gethPrimeFn(this.x2.B, this.aPrime2);
};

/**
 * A helper function to calculate the h Prime 1 and h Prime 2 values.
 * @method
 * @private
 * @returns {number}
 */
dE00.prototype._gethPrimeFn = function(x, y) {
    var hueAngle;
    
    if (x === 0 && y === 0) {
        return 0;
    }
    
    hueAngle = this.radiansToDegrees(Math.atan2(x, y));
    
    if (hueAngle >= 0) {
        return hueAngle;
    } else {
        return hueAngle + 360;
    }
};

/**
 * Gives the radian equivalent of a specified degree angle.
 * @method
 * @returns {number}
 */
dE00.prototype.radiansToDegrees = function(radians) {
    return radians * (180 / Math.PI);
};

/**
 * Gives the degree equivalent of a specified radian.
 * @method
 * @returns {number}
 */
dE00.prototype.degreesToRadians = function(degrees) {
    return degrees * (Math.PI / 180);
};

module.exports = dE00;
},{}],2:[function(require,module,exports){
'use strict';

/**
 * @class dE76
 * @classdesc
 * The CIE76 color difference algorithm: a simple euclidean distance calculation.
 * http://en.wikipedia.org/wiki/Color_difference#CIE76
 * @constructs dE76
 * @memberOf DeltaE
 * @property {object} x1 The LAB color configuration object.
 * @property {number} x1.L The lightness value, on scale of 0-100.
 * @property {number} x1.A The chroma value, on scale of -128 to 128.
 * @property {number} x1.B The hue value, on scale of -128 to 128.
 * @property {object} x2 The LAB color configuration object.
 * @property {number} x2.L The lightness value, on scale of 0-100.
 * @property {number} x2.A The chroma value, on scale of -128 to 128.
 * @property {number} x2.B The hue value, on scale of -128 to 128.
 * @example
 * var deltaE = new dE76(
 *     {L:50, A:50, B:50},
 *     {L:100, A:50, B:50},
 * );
 * console.log(deltaE.getDeltaE());
 */
function dE76(x1, x2) {
    this.x1 = x1;
    this.x2 = x2;
}

/**
 * Returns the dE76 value.
 * @method
 * @returns {number}
 */
dE76.prototype.getDeltaE = function() {
    var x1 = this.x1;
    var x2 = this.x2;
    
    return Math.sqrt(
        Math.pow(x2.L - x1.L, 2) +
        Math.pow(x2.A - x1.A, 2) +
        Math.pow(x2.B - x1.B, 2)
    );
};

module.exports = dE76;
},{}],3:[function(require,module,exports){
'use strict';

/**
 * @class dE94
 * @classdesc
 * The CIE94 algorithm: an iteration of the CIE76 algorithm.
 * http://en.wikipedia.org/wiki/Color_difference#CIE94
 * @constructs dE94
 * @memberOf DeltaE
 * @property {object} x1 The LAB color configuration object.
 * @property {number} x1.L The lightness value, on scale of 0-100.
 * @property {number} x1.A The chroma value, on scale of -128 to 128.
 * @property {number} x1.B The hue value, on scale of -128 to 128.
 * @property {object} x2 The LAB color configuration object.
 * @property {number} x2.L The lightness value, on scale of 0-100.
 * @property {number} x2.A The chroma value, on scale of -128 to 128.
 * @property {number} x2.B The hue value, on scale of -128 to 128.
 * @property {object} weights The weights configuration object.
 * @property {number} weights.lightness A weight factor to apply to lightness.
 * @property {number} weights.chroma A weight factor to apply to chroma.
 * @property {number} weights.hue A weight factor to apply to hue.
 * @example
 * var deltaE = new dE94(
 *     {L:50, A:50, B:50},
 *     {L:100, A:50, B:50},
 * );
 * console.log(deltaE.getDeltaE());
 */
function dE94(x1, x2, weights) {
    this.x1 = x1;
    this.x2 = x2;
    
    this.weights = weights || {};
    this.weights.lightness = this.weights.lightness || 1;
    this.weights.chroma = this.weights.chroma || 1;
    this.weights.hue = this.weights.hue || 1;
    
    if (1 === this.weights.lightness) {
        this.weights.K1 = 0.045;
        this.weights.K2 = 0.015;
    } else {
        this.weights.K1 = 0.048;
        this.weights.K2 = 0.014;
    }
}

/**
 * Returns the dE94 value.
 * @method
 * @returns {number}
 */
dE94.prototype.getDeltaE = function() {
    var x1 = this.x1;
    var x2 = this.x2;
    var sqrt = Math.sqrt;
    var pow = Math.pow;
    
    return sqrt(
        pow(this.calculateL(x1, x2), 2) +
        pow(this.calculateA(x1, x2), 2) +
        pow(this.calculateB(x1, x2), 2)
    );
};

/**
 * Calculates the lightness value.
 * @method
 * @returns {number}
 */
dE94.prototype.calculateL = function(x1, x2) {
    return (x1.L - x2.L) / this.weights.lightness;
};

/**
 * Calculates the chroma value.
 * @method
 * @returns {number}
 */
dE94.prototype.calculateA = function(x1, x2) {
    var sqrt = Math.sqrt;
    var pow = Math.pow;
    
    //top
    var c1 = sqrt(pow(x1.A, 2) + pow(x1.B, 2));
    var c2 = sqrt(pow(x2.A, 2) + pow(x2.B, 2));
    var cab = c1 - c2;
    
    // bottom
    var sc = 1 + (this.weights.K1 * c1);
    
    return cab / (this.weights.chroma * sc);
};

/**
 * Calculates the hue value.
 * @method
 * @returns {number}
 */
dE94.prototype.calculateB = function(x1, x2) {
    var sqrt = Math.sqrt;
    var pow = Math.pow;
    
    // cab
    var c1 = sqrt(pow(x1.A, 2) + pow(x1.B, 2));
    var c2 = sqrt(pow(x2.A, 2) + pow(x2.B, 2));
    var cab = c1 - c2;
    
    // top
    var a = x1.A - x2.A;
    var b = x1.B - x2.B;
    var hab = sqrt(
        pow(a, 2) +
        pow(b, 2) -
        pow(cab, 2)
    );
    
    // bottom
    var c1 = sqrt(pow(x1.A, 2) + pow(x1.B, 2));
    var sh = 1 + (this.weights.K2 * c1);
    
    return hab / sh;
};

module.exports = dE94;
},{}],4:[function(require,module,exports){
'use strict';

/**
 * @class DeltaE
 * @classdesc
 * A package of dE76, dE94, and dE00 algorithms.
 * @constructs DeltaE
 * @example
 * var DeltaE = new DeltaE();
 * var labColor1 = {L: 50, A: 50, B: 50};
 * var labColor2 = {L: 20, A: 20, B: 20};
 * 
 * DeltaE.getDeltaE94(labColor1, labColor2);
 */
var dE76 = require('./dE76');
var dE94 = require('./dE94');
var dE00 = require('./dE00');

function DeltaE() {}

/**
 * The CIE76 color difference algorithm: a simple euclidean distance calculation.
 * http://en.wikipedia.org/wiki/Color_difference#CIE76
 * @property {object} x1 The LAB color configuration object.
 * @property {number} x1.L The lightness value, on scale of 0-100.
 * @property {number} x1.A The chroma value, on scale of -128 to 128.
 * @property {number} x1.B The hue value, on scale of -128 to 128.
 * @property {object} x2 The LAB color configuration object.
 * @property {number} x2.L The lightness value, on scale of 0-100.
 * @property {number} x2.A The chroma value, on scale of -128 to 128.
 * @property {number} x2.B The hue value, on scale of -128 to 128.
 * @returns {number} The computed dE76 value.
 * @example
 * var labColor1 = {L: 50, A: 50, B: 50};
 * var labColor2 = {L: 20, A: 20, B: 20};
 * 
 * DeltaE.getDeltaE76(labColor1, labColor2);
 */
DeltaE.prototype.getDeltaE76 = function(lab1, lab2) {
    var deltaE = new dE76(lab1, lab2);
    return deltaE.getDeltaE();
};

/**
 * The CIE94 algorithm: an iteration of the CIE76 algorithm.
 * http://en.wikipedia.org/wiki/Color_difference#CIE94
 * @property {object} x1 The LAB color configuration object.
 * @property {number} x1.L The lightness value, on scale of 0-100.
 * @property {number} x1.A The chroma value, on scale of -128 to 128.
 * @property {number} x1.B The hue value, on scale of -128 to 128.
 * @property {object} x2 The LAB color configuration object.
 * @property {number} x2.L The lightness value, on scale of 0-100.
 * @property {number} x2.A The chroma value, on scale of -128 to 128.
 * @property {number} x2.B The hue value, on scale of -128 to 128.
 * @property {object} weights The weights configuration object.
 * @property {number} weights.lightness A weight factor to apply to lightness.
 * @property {number} weights.chroma A weight factor to apply to chroma.
 * @property {number} weights.hue A weight factor to apply to hue.
 * @returns {number} The computed dE94 value.
 * @example
 * var labColor1 = {L: 50, A: 50, B: 50};
 * var labColor2 = {L: 20, A: 20, B: 20};
 * 
 * DeltaE.getDeltaE94(labColor1, labColor2);
 */
DeltaE.prototype.getDeltaE94 = function(lab1, lab2) {
    var deltaE = new dE94(lab1, lab2);
    return deltaE.getDeltaE();
};

/**
 * The CIE2000 color difference algorithm.
 * http://en.wikipedia.org/wiki/Color_difference#CIEDE2000
 * @property {object} x1 The LAB color configuration object.
 * @property {number} x1.L The lightness value, on scale of 0-100.
 * @property {number} x1.A The chroma value, on scale of -128 to 128.
 * @property {number} x1.B The hue value, on scale of -128 to 128.
 * @property {object} x2 The LAB color configuration object.
 * @property {number} x2.L The lightness value, on scale of 0-100.
 * @property {number} x2.A The chroma value, on scale of -128 to 128.
 * @property {number} x2.B The hue value, on scale of -128 to 128.
 * @property {object} weights The weights configuration object.
 * @property {number} weights.lightness A weight factor to apply to lightness.
 * @property {number} weights.chroma A weight factor to apply to chroma.
 * @property {number} weights.hue A weight factor to apply to hue.
 * @returns {number} The computed dE00 value.
 * @example
 * var labColor1 = {L: 50, A: 50, B: 50};
 * var labColor2 = {L: 20, A: 20, B: 20};
 * 
 * DeltaE.getDeltaE00(labColor1, labColor2);
 */
DeltaE.prototype.getDeltaE00 = function(lab1, lab2) {
    var deltaE = new dE00(lab1, lab2);
    return deltaE.getDeltaE();
};

module.exports = new DeltaE;
},{"./dE00":1,"./dE76":2,"./dE94":3}],5:[function(require,module,exports){
window.DeltaE = require('delta-e')

},{"delta-e":4}]},{},[5]);
