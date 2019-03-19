module ShopsHelper
  def show_shop_image(shop)
    if shop.image.attached?
      image_tag shop.image.variant(resize: "300x300"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end
  def show_shop_small_image(shop)
    if shop.image.attached?
      image_tag shop.image.variant(resize: "50x50"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail", width: 50
    end
  end
end
