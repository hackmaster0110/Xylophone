from xylcom import mainloop
import pygame
import pyaudio
import wave
from pygame.locals import *

pygame.init()


SCREEN_WIDTH=1024
SCREEN_HEIGHT=768
size = [SCREEN_WIDTH, SCREEN_HEIGHT]
screen = pygame.display.set_mode(size)
background=pygame.image.load("xylonew.png")


screen.blit(background, (0, 0))

mainloop()

pygame.quit()
quit()