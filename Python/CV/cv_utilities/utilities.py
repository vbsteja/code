import cv2 as cv
import matplotlib.pyplot as plt
import numpy as np

def show_image(image_path,type = "matplotlib"):

    image = cv.imread(image_path, 0)
    if type == "cv":
        cv.imshow("original",image)
        cv.waitKey(0)
        cv.destroyWindow()
    else:
        plt.imshow(image,cmap = 'gray', interpolation = 'bicubic')
        plt.xticks([])
        plt.yticks([])
        plt.show()
def show_cam_video():
    cap = cv.VideoCapture(0)
    #cap.open(0)
    while True:
        ret, frame = cap.read()
        gray = cv.cvtColor(frame, cv.COLORMAP_BONE)

        cv.imshow('frame',gray)
        if cv.waitKey(1) & 0xFF == ord('q'):
            break
    cap.release()
    cv.destroyAllWindows()

def record_camera_video():
	pass

def draw_a_line():

	img  = np.zeros((512,512,3),np.uint8)
	cv.line(img,(0,0),(511,511),(255,0,0),5)


