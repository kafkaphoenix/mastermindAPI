from django.db import models
from exrex import getone

from api.constants import COLOR_REGEX


class GameManager(models.Manager):
    def create(self, *args, **kwargs):
        if 'secret' not in kwargs:
            kwargs['secret'] = getone(COLOR_REGEX)
        return super(GameManager, self).create(*args, **kwargs)
