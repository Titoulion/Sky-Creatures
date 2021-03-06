﻿using UnityEngine;
using System.Collections;

public class CloudsLayerScript : MonoBehaviour {

	// Use this for initialization

	public Material myMat;

	public Vector2 minMaxCloud;
	public AnimationCurve curveVanish;
	float valueFeedbackDistance = 0f;
	float currentValueFeedbackDistance = 0f;

	public CreatureScript myCreature;

	public int indexLayer;
	float progressIntro = 0f;





	public void SetMyCreature(CreatureScript creat)
	{
		myCreature = creat;
		myCreature.SetRandomPosition(indexLayer);
		//myCreature.gameObject.transform.parent = transform;
		myCreature.gameObject.transform.position = new Vector3(0f,-17f,-1.83f);
		myCreature.gameObject.transform.localScale = new Vector3(6f,6f,6f);


		myCreature.myMatBase.SetTexture("_Perlin3",myMat.GetTexture("_Perlin3"));
		myCreature.myMatBase.SetTexture("_Perlin4",myMat.GetTexture("_Perlin4"));

		myCreature.myMatBase.SetTextureOffset("_Perlin3",new Vector2(myMat.GetTextureOffset("_Perlin3").x+myMat.GetTextureScale("_Perlin3").x,myMat.GetTextureOffset("_Perlin3").y+myMat.GetTextureScale("_Perlin3").y-0.5f));
		myCreature.myMatBase.SetTextureOffset("_Perlin4",new Vector2(myMat.GetTextureOffset("_Perlin4").x+myMat.GetTextureScale("_Perlin4").x,myMat.GetTextureOffset("_Perlin4").y+myMat.GetTextureScale("_Perlin4").y-0.5f));
		myCreature.myMatBase.SetTextureScale("_Perlin3",new Vector2(-myMat.GetTextureScale("_Perlin3").x,myMat.GetTextureScale("_Perlin3").y));
		myCreature.myMatBase.SetTextureScale("_Perlin4",new Vector2(-myMat.GetTextureScale("_Perlin4").x,myMat.GetTextureScale("_Perlin4").y));


		myCreature.myMatBase.SetFloat("_SizeClouds",myMat.GetFloat("_SizeClouds"));
		myCreature.myMatBase.SetColor("_ColorOutline",myMat.GetColor("_ColorOutline"));
		myCreature.myMatBase.SetFloat("_GlobalDistoForce",myMat.GetFloat("_GlobalDistoForce"));
		//myCreature.myMatBase.SetFloat("_SizeClouds",myMat.GetFloat("_SizeClouds"));
	}


	void Awake () {
		myMat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () 
	{

		if(MainScript.Instance.gameStarted)
		{
			currentValueFeedbackDistance = Mathf.Lerp(currentValueFeedbackDistance,valueFeedbackDistance,0.1f);
			//myMat.SetFloat("_FeedbackDistance",currentValueFeedbackDistance);
			myCreature.myMatBase.SetFloat("_ProgressApparition",currentValueFeedbackDistance);
			
			
			if(MainScript.Instance.frontIndex == indexLayer)
			{
				progressIntro+=Time.deltaTime;
				progressIntro = Mathf.Clamp01(progressIntro);
			}

		}

		myMat.SetFloat("_ProgressIntro",progressIntro);
		myCreature.myMatBase.SetFloat("_ProgressIntro",progressIntro);





	}

	public void Vanish(float progress)
	{
		myMat.SetFloat ("_SizeClouds", Mathf.Lerp(minMaxCloud.x,minMaxCloud.y,curveVanish.Evaluate(progress)));
	}

	public void SetTransitionColor(float value)
	{
		//Vector2 valueOffset = myMat.GetTextureOffset("_Perlin3");
		//valueOffset.x+= value;

		//myMat.SetTextureOffset("_Perlin3",valueOffset);
		//myCreature.myMatBase.SetTextureOffset("_Perlin3",valueOffset);

		float value1 = myMat.GetFloat("_TransitionColor");
		value1+= value;
		
		
		
		myMat.SetFloat("_TransitionColor",value1);
	//	myCreature.myMatBase.SetFloat("_TransitionColor",value);

		//valueOffset = myMat.GetTextureOffset("_TextureFeedback");
	//	valueOffset.x+= value;


		
		//myMat.SetTextureOffset("_TextureFeedback",valueOffset);

	
	}

	public void SetValueDistort(float value)
	{
		float value2 = myMat.GetFloat("_ValueDistort");
		value2+= value;


		
		myMat.SetFloat("_ValueDistort",value2);
		myCreature.myMatBase.SetFloat("_ValueDistort",value2);
		
		
	}


	public float GetValueX()
	{
		return(Modulo (myMat.GetFloat("_ValueDistort"),Mathf.PI*2f)/(2f*Mathf.PI));
	}

	public float GetValueY()
	{
		return(Modulo (myMat.GetFloat("_TransitionColor"),Mathf.PI*2f)/(2f*Mathf.PI));
	}

	public void SetValueFeedbackDistance(float value)
	{
		valueFeedbackDistance = value;
	}

	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}





}
