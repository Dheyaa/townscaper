class HomeController < ApplicationController
  # Main index
  def index
  end

  # view for modifying all variables
  def home
    @admin_panel = AdminPanel.find_by(admin_id: current_admin.id)
    unless params[:sendArray]
      number = 1
    end
    if params[:sendArray]
      array = params[:sendArray].split(",")
      number = array[4].to_i
      if number <= 50
        name = "all#{number}.png"
        @scene = Scene.new(file_name: name, vertices_number: array[0].to_f, space_ratio: array[1].to_f, position_difference: array[2].to_f, colour_difference: array[3].to_f);
        @scene.save 
        number +=1
        gon.vn = array[0].to_f
        gon.sr = array[1].to_f
        gon.pd = array[2].to_f
        gon.cd = array[3].to_f
      else
        flash[:alert] = '50 Scenes have been generated'
      end
    end
    gon.sendNumber = number
    gon.myname = "all#{number}.png"

    if Scene.all.count == 48
      Scene.all.order('created_at ASC')
      a = 0;
      b = 1;
      c = 2;
      while a < Scene.all.count 
        scene1 = Scene.all.order('created_at ASC')[a]
        @scene1 = Scene1.new(file_name: scene1.file_name, vertices_number: scene1.vertices_number, space_ratio: scene1.space_ratio, position_difference: scene1.position_difference, colour_difference: scene1.colour_difference);
        @scene1.save

        scene2 = Scene.all.order('created_at ASC')[b]
        @scene2 = Scene2.new(file_name: scene2.file_name, vertices_number: scene2.vertices_number, space_ratio: scene2.space_ratio, position_difference: scene2.position_difference, colour_difference: scene2.colour_difference);
        @scene2.save

        scene3 = Scene.all.order('created_at ASC')[c]
        @scene3 = Scene3.new(file_name: scene3.file_name, vertices_number: scene3.vertices_number, space_ratio: scene3.space_ratio, position_difference: scene3.position_difference, colour_difference: scene3.colour_difference);
        @scene3.save
        a+=3
        b+=3
        c+=3
      end
    end

  end
  # delete all scenes
  def delete_all_scenes
    Scene.delete_all
    Scene1.delete_all
    Scene2.delete_all
    Scene3.delete_all
    redirect_to home_home_url
  end
  def datapresentation
  end

  # View for modifying vertices_number
  def vertices_number
    @admin_panel = AdminPanel.find_by(admin_id: current_admin.id)
    unless params[:sendArray]
      number = 1
    end
    if params[:sendArray]
      array = params[:sendArray].split(",")
      number = array[4].to_i
      if number <= 50
        name = "v#{number}.png"
        @scene = VerticesScene.new(file_name: name, vertices_number: array[0].to_f, space_ratio: array[1].to_f, position_difference: array[2].to_f, colour_difference: array[3].to_f);
        @scene.save 
        number +=1
        gon.vn = array[0].to_f
        gon.sr = array[1].to_f
        gon.pd = array[2].to_f
        gon.cd = array[3].to_f
      else
        flash[:alert] = '50 Scenes have been generated'
      end
    end
    gon.sendNumber = number
    gon.myname = "v#{number}.png"

    if VerticesScene.all.count == 48
      VerticesScene.all.order(:vertices_number)
      a = 0;
      b = 1;
      c = 2;
      while a < VerticesScene.all.count 
        scene1 = VerticesScene.all.order(:vertices_number)[a]
        @scene1 = VerticesScene1.new(file_name: scene1.file_name, vertices_number: scene1.vertices_number, space_ratio: scene1.space_ratio, position_difference: scene1.position_difference, colour_difference: scene1.colour_difference);
        @scene1.save

        scene2 = VerticesScene.all.order(:vertices_number)[b]
        @scene2 = VerticesScene2.new(file_name: scene2.file_name, vertices_number: scene2.vertices_number, space_ratio: scene2.space_ratio, position_difference: scene2.position_difference, colour_difference: scene2.colour_difference);
        @scene2.save

        scene3 = VerticesScene.all.order(:vertices_number)[c]
        @scene3 = VerticesScene3.new(file_name: scene3.file_name, vertices_number: scene3.vertices_number, space_ratio: scene3.space_ratio, position_difference: scene3.position_difference, colour_difference: scene3.colour_difference);
        @scene3.save
        a+=3
        b+=3
        c+=3
      end
    end

  end
  # delete all scenes
  def delete_all_scenes_vertices
    VerticesScene.delete_all
    VerticesScene1.delete_all
    VerticesScene2.delete_all
    VerticesScene3.delete_all
    redirect_to home_vertices_number_url
  end
  def vertices_datapresentation
  end


  # View for modifying space_ratio
  def space_ratio
    @admin_panel = AdminPanel.find_by(admin_id: current_admin.id)
    unless params[:sendArray]
      number = 1
    end
    if params[:sendArray]
      array = params[:sendArray].split(",")
      number = array[4].to_i
      if number <= 48
        name = "s#{number}.png"
        @scene = SpaceScene.new(file_name: name, vertices_number: array[0].to_f, space_ratio: array[1].to_f, position_difference: array[2].to_f, colour_difference: array[3].to_f);
        @scene.save 
        number +=1
        gon.vn = array[0].to_f
        gon.sr = array[1].to_f
        gon.pd = array[2].to_f
        gon.cd = array[3].to_f
      else
        flash[:alert] = '48 Scenes have been generated'
      end
    end
    gon.sendNumber = number
    gon.myname = "s#{number}.png"

    if SpaceScene.all.count == 48
      SpaceScene.all.order(:space_ratio)
      a = 0;
      b = 1;
      c = 2;
      while a < SpaceScene.all.count 
        scene1 = SpaceScene.all.order(:space_ratio)[a]
        @scene1 = SpaceScene1.new(file_name: scene1.file_name, vertices_number: scene1.vertices_number, space_ratio: scene1.space_ratio, position_difference: scene1.position_difference, colour_difference: scene1.colour_difference);
        @scene1.save

        scene2 = SpaceScene.all.order(:space_ratio)[b]
        @scene2 = SpaceScene2.new(file_name: scene2.file_name, vertices_number: scene2.vertices_number, space_ratio: scene2.space_ratio, position_difference: scene2.position_difference, colour_difference: scene2.colour_difference);
        @scene2.save

        scene3 = SpaceScene.all.order(:space_ratio)[c]
        @scene3 = SpaceScene3.new(file_name: scene3.file_name, vertices_number: scene3.vertices_number, space_ratio: scene3.space_ratio, position_difference: scene3.position_difference, colour_difference: scene3.colour_difference);
        @scene3.save
        a+=3
        b+=3
        c+=3
      end
    end

  end
  # delete all scenes
  def delete_all_scenes_space
    SpaceScene.delete_all
    SpaceScene1.delete_all
    SpaceScene2.delete_all
    SpaceScene3.delete_all
    redirect_to home_space_ratio_url
  end
  def space_datapresentation
  end


  # View for modifying position
  def position_difference
    @admin_panel = AdminPanel.find_by(admin_id: current_admin.id)
    unless params[:sendArray]
      number = 1
    end
    if params[:sendArray]
      array = params[:sendArray].split(",")
      number = array[4].to_i
      if number <= 48
        name = "p#{number}.png"
        @scene = PositionScene.new(file_name: name, vertices_number: array[0].to_f, space_ratio: array[1].to_f, position_difference: array[2].to_f, colour_difference: array[3].to_f);
        @scene.save 
        number +=1
        gon.vn = array[0].to_f
        gon.sr = array[1].to_f
        gon.pd = array[2].to_f
        gon.cd = array[3].to_f
      else
        flash[:alert] = '48 Scenes have been generated'
      end
    end
    gon.sendNumber = number
    gon.myname = "p#{number}.png"

    if PositionScene.all.count == 48
      PositionScene.all.order(:position_difference)
      a = 0;
      b = 1;
      c = 2;
      while a < PositionScene.all.count 
        scene1 = PositionScene.all.order(:position_difference)[a]
        @scene1 = PositionScene1.new(file_name: scene1.file_name, vertices_number: scene1.vertices_number, space_ratio: scene1.space_ratio, position_difference: scene1.position_difference, colour_difference: scene1.colour_difference);
        @scene1.save

        scene2 = PositionScene.all.order(:position_difference)[b]
        @scene2 = PositionScene2.new(file_name: scene2.file_name, vertices_number: scene2.vertices_number, space_ratio: scene2.space_ratio, position_difference: scene2.position_difference, colour_difference: scene2.colour_difference);
        @scene2.save

        scene3 = PositionScene.all.order(:position_difference)[c]
        @scene3 = PositionScene3.new(file_name: scene3.file_name, vertices_number: scene3.vertices_number, space_ratio: scene3.space_ratio, position_difference: scene3.position_difference, colour_difference: scene3.colour_difference);
        @scene3.save
        a+=3
        b+=3
        c+=3
      end
    end

  end
  # delete all scenes
  def delete_all_scenes_position
    PositionScene.delete_all
    PositionScene1.delete_all
    PositionScene2.delete_all
    PositionScene3.delete_all
    redirect_to home_position_difference_url
  end
  def position_datapresentation
  end
  

  # View for modifying Colour
  def colour_difference
    @admin_panel = AdminPanel.find_by(admin_id: current_admin.id)
    unless params[:sendArray]
      number = 1
    end
    if params[:sendArray]
      array = params[:sendArray].split(",")
      number = array[4].to_i
      if number <= 48
        name = "c#{number}.png"
        @scene = ColourScene.new(file_name: name, vertices_number: array[0].to_f, space_ratio: array[1].to_f, position_difference: array[2].to_f, colour_difference: array[3].to_f);
        @scene.save 
        number +=1
        gon.vn = array[0].to_f
        gon.sr = array[1].to_f
        gon.pd = array[2].to_f
        gon.cd = array[3].to_f
      else
        flash[:alert] = '48 Scenes have been generated'
      end
    end
    gon.sendNumber = number
    gon.myname = "c#{number}.png"

    if ColourScene.all.count == 48
      ColourScene.all.order(:colour_difference)
      a = 0;
      b = 1;
      c = 2;
      while a < ColourScene.all.count 
        scene1 = ColourScene.all.order(:colour_difference)[a]
        @scene1 = ColourScene1.new(file_name: scene1.file_name, vertices_number: scene1.vertices_number, space_ratio: scene1.space_ratio, position_difference: scene1.position_difference, colour_difference: scene1.colour_difference);
        @scene1.save

        scene2 = ColourScene.all.order(:colour_difference)[b]
        @scene2 = ColourScene2.new(file_name: scene2.file_name, vertices_number: scene2.vertices_number, space_ratio: scene2.space_ratio, position_difference: scene2.position_difference, colour_difference: scene2.colour_difference);
        @scene2.save

        scene3 = ColourScene.all.order(:colour_difference)[c]
        @scene3 = ColourScene3.new(file_name: scene3.file_name, vertices_number: scene3.vertices_number, space_ratio: scene3.space_ratio, position_difference: scene3.position_difference, colour_difference: scene3.colour_difference);
        @scene3.save
        a+=3
        b+=3
        c+=3
      end
    end

  end
  # delete all scenes
  def delete_all_scenes_colour
    ColourScene.delete_all
    ColourScene1.delete_all
    ColourScene2.delete_all
    ColourScene3.delete_all
    redirect_to home_colour_difference_url
  end
  def colour_datapresentation
  end


  # View for modifying Factorial Design
  def factorial
    @admin_panel = AdminPanel.find_by(admin_id: current_admin.id)
    unless params[:sendArray]
      number = 1
    end
    if params[:sendArray]
      array = params[:sendArray].split(",")
      number = array[4].to_i
      if number <= 81
        name = "f#{number}.png"
        @scene = FactorialScene.new(file_name: name, vertices_number: array[0].to_f, space_ratio: array[1].to_f, position_difference: array[2].to_f, colour_difference: array[3].to_f);
        @scene.save 
        number +=1
        gon.vn = array[0].to_f
        gon.sr = array[1].to_f
        gon.pd = array[2].to_f
        gon.cd = array[3].to_f
      else
        flash[:alert] = '81 Scenes have been generated'
      end
    end
    gon.sendNumber = number
    gon.myname = "f#{number}.png"

    if FactorialScene.all.count == 81
      FactorialScene.all.order('created_at ASC')
      a = 0;
      b = 1;
      c = 2;
      d = 3;
      e = 4;
      while e < FactorialScene.all.count 
        scene1 = FactorialScene.all.order('created_at ASC')[a]
        @scene1 = FactorialScene1.new(file_name: scene1.file_name, vertices_number: scene1.vertices_number, space_ratio: scene1.space_ratio, position_difference: scene1.position_difference, colour_difference: scene1.colour_difference);
        @scene1.save

        scene2 = FactorialScene.all.order('created_at ASC')[b]
        @scene2 = FactorialScene2.new(file_name: scene2.file_name, vertices_number: scene2.vertices_number, space_ratio: scene2.space_ratio, position_difference: scene2.position_difference, colour_difference: scene2.colour_difference);
        @scene2.save

        scene3 = FactorialScene.all.order('created_at ASC')[c]
        @scene3 = FactorialScene3.new(file_name: scene3.file_name, vertices_number: scene3.vertices_number, space_ratio: scene3.space_ratio, position_difference: scene3.position_difference, colour_difference: scene3.colour_difference);
        @scene3.save

        scene4 = FactorialScene.all.order('created_at ASC')[d]
        @scene4 = FactorialScene4.new(file_name: scene4.file_name, vertices_number: scene4.vertices_number, space_ratio: scene4.space_ratio, position_difference: scene4.position_difference, colour_difference: scene4.colour_difference);
        @scene4.save

        scene5 = FactorialScene.all.order('created_at ASC')[e]
        @scene5 = FactorialScene5.new(file_name: scene5.file_name, vertices_number: scene5.vertices_number, space_ratio: scene5.space_ratio, position_difference: scene5.position_difference, colour_difference: scene5.colour_difference);
        @scene5.save
        a+=5
        b+=5
        c+=5
        d+=5
        e+=5
      end
      scene5 = FactorialScene.all.order('created_at ASC').last
      @scene5 = FactorialScene5.new(file_name: scene5.file_name, vertices_number: scene5.vertices_number, space_ratio: scene5.space_ratio, position_difference: scene5.position_difference, colour_difference: scene5.colour_difference);
      @scene5.save
    end

  end
  # delete all scenes
  def delete_all_scenes_factorial
    FactorialScene.delete_all
    FactorialScene1.delete_all
    FactorialScene2.delete_all
    FactorialScene3.delete_all
    FactorialScene4.delete_all
    FactorialScene5.delete_all    
    redirect_to home_factorial_url
  end
  def factorial_datapresentation
  end
  
end
