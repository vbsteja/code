import tensorflow
import cv2
from PIL import Image, ImageFilter

# Read Image
im = Image.open("cover.jpeg")

# display Image
im.show()

# Filter Image
im_sharp = im.filter(ImageFilter.SHARPEN)
im_sharp.save('sharpen_cover.jpeg','JPEG')

im_sharp = Image.open("cover.jpeg")
im_sharp.show()