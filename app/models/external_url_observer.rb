class ExternalUrlObserver < ActiveRecord::Observer

  def after_create(external_url)
    box = external_url.box
    result = box.result.present? ? box.result : box.create_result
    result.filled! if result.new?
  end

end
