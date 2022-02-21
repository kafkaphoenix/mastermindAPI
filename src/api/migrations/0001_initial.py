# Generated by Django 4.0.2 on 2022-02-20 23:43

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Game',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('secret', models.CharField(
                    max_length=4,
                    validators=[django.core.validators.RegexValidator(regex='^[RGBYPO]{4}$')]
                )),
            ],
        ),
        migrations.CreateModel(
            name='Guess',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('guess', models.CharField(
                    max_length=4,
                    validators=[django.core.validators.RegexValidator(regex='^[RGBYPO]{4}$')]
                )),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('session', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.game')),
            ],
            options={
                'ordering': ['created_at'],
            },
        ),
    ]