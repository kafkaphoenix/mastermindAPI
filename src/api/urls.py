from rest_framework.routers import DefaultRouter

from api.views.game import GameViewSet

router = DefaultRouter()
router.register(r'game', GameViewSet, basename='game')

urlpatterns = router.urls
