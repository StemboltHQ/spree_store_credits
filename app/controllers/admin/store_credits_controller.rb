class Admin::StoreCreditsController < Admin::BaseController
  resource_controller
  before_filter :check_amounts, :only => [:edit, :update]
  
  create.response do |wants|
    wants.html { redirect_to collection_url }
  end

  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  destroy.success.wants.js { render_js_for_destroy }
  
  private
  def check_amounts
    if (object.remaining_amount < object.amount)
      flash[:error] = "Can't be edit, b/c already was used."
      redirect_to collection_url
    end
  end
end
