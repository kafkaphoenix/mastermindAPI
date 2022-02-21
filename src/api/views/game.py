from rest_framework.viewsets import ModelViewSet

from api.models.game import Game
from api.serializers.game import GameSerializer


class GameViewSet(ModelViewSet):
    http_method_names = ('get', 'post',)
    queryset = Game.objects.all()
    serializer_class = GameSerializer
