using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DG.Tweening;
using UnityEngine;

public class Nest : MonoBehaviourBase
{
    [SerializeField] private float appearTime = 1;
    [SerializeField] private DG.Tweening.Ease appearEase = DG.Tweening.Ease.Linear;

    [SerializeField] private float disappearTime = 1;
    [SerializeField] private DG.Tweening.Ease disappearEase = DG.Tweening.Ease.Linear;

    [SerializeField] private float flyAwayY;
    [SerializeField] private float flyAwayTime;
    [SerializeField] private DG.Tweening.Ease flyAwayEase = DG.Tweening.Ease.Linear;

    [SerializeField] private float flyInTime;
    [SerializeField] private DG.Tweening.Ease flyInEase = DG.Tweening.Ease.Linear;

    private int creatureCount = 3;

    private List<Creature> creatures;

    private void Awake()
    {
        creatures = new List<Creature>();
    }

    public void SpawnCreatures(int[] seeds)
    {
        RemoveCreatures(false);

        creatureCount = seeds.Length;

        foreach (var seed in seeds)
        {
            var creature = CreateCreature(seed);
            AnimationAppear(creature);
        }
    }

    public void CreaturesFlyAway()
    {
        foreach (var creature in creatures)
        {
            AnimationFlyOut(creature);
        }
    }

    public void CreatureCaught(int seed)
    {
        var creature = creatures.FirstOrDefault(c => c.Seed == seed);
        if (creature == null)
            return;

        AnimationFlyIn(creature);
    }

    public void RemoveCreatures(bool animate)
    {
        foreach (var creature in creatures)
        {
            if (animate)
            {
                AnimationDisappear(creature);
            }
            else
            {
                Destroy(creature.gameObject);
            }
        }
        creatures.Clear();
    }

    private Creature CreateCreature(int seed)
    {
        var screenWidth = Camera.main.ScreenToWorldPoint(new Vector3()).x * -2;
        var index = creatures.Count;
        var percentX = (float)(index + 1) / (creatureCount + 1);
        var position = new Vector2(-screenWidth / 2 + percentX * screenWidth, 0);

        var creature = CreatureCreator.Instance.SpawnRandom(seed);
        creature.transform.position = position;
        creatures.Add(creature);

        return creature;
    }

    private void AnimationAppear(Creature creature)
    {
        creature.transform.localScale = Vector3.zero;
        creature.transform.DOScale(1f, appearTime).SetEase(appearEase).Play();
    }

    private void AnimationDisappear(Creature creature)
    {
        var tween = creature.transform.DOScale(0f, disappearTime).SetEase(disappearEase);
        tween.OnKill(() => Destroy(creature.gameObject));
        tween.Play();
    }

    private void AnimationFlyOut(Creature creature)
    {
        creature.GetComponentInChildren<CreaturePartMovementCenterGravity>().enabled = false;
        creature.transform.DOMoveY(flyAwayY, flyAwayTime).SetEase(flyAwayEase).Play();
    }

    private void AnimationFlyIn(Creature creature)
    {
        var tween = creature.transform.DOMoveY(0, flyInTime).SetEase(flyInEase);
        tween.OnKill(() => creature.GetComponentInChildren<CreaturePartMovementCenterGravity>().enabled = true);
        tween.Play();
    }
}

