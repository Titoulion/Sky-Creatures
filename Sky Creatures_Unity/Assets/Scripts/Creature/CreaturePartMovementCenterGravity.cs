using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreaturePartMovementCenterGravity : MonoBehaviourBase
{
    [SerializeField] private CreaturePartMovementCenterGravitySettings settings;

    private Vector2 speed;
    private Vector2 startPosition;
    private Vector2 acceleration;

    private Countdown pickAccelerationCountdown;

    private void Start()
    {
        if (settings == null)
        {
            Destroy(this);
            return;
        }

        speed = MathUtil.RandomOnUnitCircle * settings.startSpeed.Random;

        startPosition = transform.position;

        pickAccelerationCountdown = new Countdown(0);
        PickAcceleration();
    }

    private void PickAcceleration()
    {
        acceleration = MathUtil.RandomOnUnitCircle * settings.accelerationSpeed.Random;
        pickAccelerationCountdown.Reset(settings.accelerationChangeDelay.Random);
    }

    private void FixedUpdate()
    {
        if (pickAccelerationCountdown.Update())
        {
            PickAcceleration();
        }

        var delta = (startPosition - (Vector2) transform.position) / settings.scale;
        speed += (delta * settings.backDeltaSpeed + delta * settings.backDeltaSpeedNormalized + acceleration) * Time.deltaTime;

        transform.Translate(speed * Time.deltaTime * settings.scale, Space.World);
    }
}
