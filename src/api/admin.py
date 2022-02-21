from django.contrib import admin

# Register your models here.
from api.models.game import Game
from api.models.guess import Guess

admin.site.register(Game)
admin.site.register(Guess)
