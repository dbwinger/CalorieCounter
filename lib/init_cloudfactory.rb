module InitCloudfactory
  def setup_line
    line = Line.create("CalorieCounter", "Web Research", :description => "Find # of calories in picture of food.") do |l|
      InputHeader.new(l,
      :label => "image_url",
      :field_type => "text_data",
      :value => "http://s3.amazon.com/caloriecounter/medium/1.jpg",
      :required => true,
      :validation_format => "url")
      Station.create(l,:type => "Work", :title => "Gather calorie counts") do |s|
        StandardInstruction.create (s, :title => "View this image and estimate the amount of calories contained in the food.", :description => '?') do |i|
          # TODO: Check if "integer" is valid validation_format
          FormField.new(:s,:label => "Number of calories:", :field_type => "text_general", :required => true, :validation_format => "integer")
        end
        HumanWorker.new(s, 10, .50)
      end
    end
  end
end

