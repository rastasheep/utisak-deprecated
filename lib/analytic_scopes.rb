module AnalyticScopes

  def self.included(base)
    base.class_eval do
      scope :created_today, lambda {
        where("DATE(created_at) = ?", Date.today)
      }
    end
  end

end
