from django.core.validators import RegexValidator
from django.db import models

from api.constants import COLOR_REGEX
from api.models.game import Game


class Guess(models.Model):
    session = models.ForeignKey(
        Game,
        on_delete=models.CASCADE,
    )
    guess = models.CharField(max_length=4, validators=[RegexValidator(regex=COLOR_REGEX)])
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['created_at']

    def __str__(self) -> str:
        return f'{self.guess}'
