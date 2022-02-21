from django.core.validators import RegexValidator
from django.db import models

from api.constants import COLOR_REGEX
from api.managers.game import GameManager


class Game(models.Model):
    secret = models.CharField(max_length=4, validators=[RegexValidator(regex=COLOR_REGEX)])

    objects = GameManager()
