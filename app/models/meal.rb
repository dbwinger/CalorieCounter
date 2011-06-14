class Meal < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable

  def save_and_send_to_cloudfactory
    require 'tempfile'
    # create temp csv file for image_url
    file = Tempfile.open('', "#{Rails.root}/tmp") do |f|
      f.print(image_url)
      f.flush
      f.close
    end

    cf_line = line.find('CalorieCounter');
    run = Run.create(line, id.to_s, file);
    update_attributes(:run_id => run.id)
    file.unlink
  end

  def calories_or_progress
    if not calories
      #Check progress of run
      # TODO: Can I get it this way?
      run = Run.find(run_id)
      if run.complete?
        process_run_results run.results
      else
        run.progress
      end
    end
    # If it's done, show the calories
    calories
  end

  private
  def process_run_results(results)
    # TODO: API not done for Results yet
    # Question: If I have one input line, one HumanWorker, with # 10, do I get one unit in results or 10?
  end
end

