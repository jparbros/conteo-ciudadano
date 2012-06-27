class ResultImageObserver < ActiveRecord::Observer

  def after_create(result_image)
    box = result_image.box
    result = box.result.present? ? box.result : box.create_result
    result.filled! if result.new?
  end

end
