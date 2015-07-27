﻿using UnityEngine;
using System.Collections;

public class MainScript : MonoBehaviour {

	// Use this for initialization

	public float value1 =0f;
	public float value2 =0f;
	public float value3 =0f;
	public float value4 =0f;
	public float value5 =0f;
	public float value6 =0f;
	public float value7 =0f;
	public float value8 =0f;

	public CloudsLayerScript[] listLayers;



	public int frontIndex = 0;
	public bool reorganising = false;
	float progressVanish = 0f;
	bool vanishing = false;
	int indexToVanish = 0;
	public float durationVanishIn = 0.3f;
	public float durationVanishOut = 0.1f;

	bool motionLayerForward = false;

	public float marginLayers = 100f;

	int indexCreatureLayer = 0;
	public float distanceCreatureMax = 0.2f;


	public float distanceMinToAppear = 0.1f;

	public static MainScript Instance;

	public bool catching = false;

    ArduinoInput inputArduino;
	bool previousStateTouchNextLayer = false;
	bool previousStateTouchCatch = false;
	//public float horizontalSpeed = 0f;


	bool isCreatuePresent = false;

	CreatureScript[] listCreatures;

	public GameObject nothingToCatch;

	public GameObject notWorking;

	public bool useArduino=false;


	void Awake()
	{
		Instance = this;
	}

	void Start () 
	{
		//CreatureCreator.Instance.


		inputArduino = ArduinoInput.Instance;

		InstantiateCreature();
		isCreatuePresent = true;


		PlaceLayers(frontIndex);
	}

	void InstantiateCreature()
	{
		listCreatures = new CreatureScript[4];


		for(int i = 0; i<4;i++)
		{
			Creature newMob = CreatureCreator.Instance.SpawnRandom();
			
			newMob.gameObject.AddComponent<CreatureScript>();

			CreatureScript newCreature = newMob.GetComponent<CreatureScript>();

			listLayers[i].SetMyCreature(newCreature);




		}






	}


	
	// Update is called once per frame
	void Update () 
	{


		KeyboardInputs();




		GetArduinoInputs();



		Reorganizing();


		UpdateValuesDistance();

		if(Input.GetKeyDown(KeyCode.R))
		{
			Application.LoadLevel(0);
		}
	






	}

	void GetArduinoInputs()
	{
		if(inputArduino.GetTouch(5))
		{
			if(previousStateTouchNextLayer==false)
			{
				GoNextLayer();
				previousStateTouchNextLayer = true;
			}


		}
		else
		{
			previousStateTouchNextLayer = false;




		}


		if(inputArduino.GetTouch(6)||inputArduino.GetTouch(1))
		{
			notWorking.GetComponent<Renderer>().enabled = true;
		}
		else
		{
			notWorking.GetComponent<Renderer>().enabled = false;
		}



		if(inputArduino.GetTouch(2))
		{
			if(previousStateTouchCatch==false)
			{
				TryCatchCreature();
				previousStateTouchCatch = true;
			}





		}
		else
		{
			previousStateTouchCatch = false;
			nothingToCatch.GetComponent<Renderer>().enabled = false;
		}

		if(useArduino)
		{
			Slider3(inputArduino.GetClosenessDistance(4));
			Slider4(inputArduino.GetClosenessDistance(3));
			Slider5(inputArduino.GetClosenessDistance(7));
			Slider6(inputArduino.GetClosenessDistance(0));
		}

	


	}

	void UpdateValuesDistance()
	{
		float horizontalSpeed = (value4-value3)*0.01f;
		listLayers[frontIndex].SetHorizontalSpeed(horizontalSpeed);


		float sensDistort = (value6-value5)*0.01f;
		listLayers[frontIndex].SetValueDistort(sensDistort);





		//for(int i = 0; i<listLayers.Length;i++)
		//{

		int i = frontIndex;

				CreatureScript layerCreature = listLayers[i].myCreature;

				Vector2 pointB = new Vector2(Modulo(layerCreature.myCoordinate.x,1f),Modulo(layerCreature.myCoordinate.y,1f));
				Vector2 pointA = new Vector2(listLayers[i].GetValueX(),listLayers[i].GetValueY());

				float distance = GetMinDistanceInLoop(pointA,pointB);

				
				float feedbackValue = (distance>distanceCreatureMax ?0f:1f-(distance/distanceCreatureMax ));

				listLayers[i].SetValueFeedbackDistance(feedbackValue);

				if(distance<=distanceMinToAppear)
				{
					layerCreature.Show();
				}
				else
				{
					layerCreature.Hide();
				}

	//	}






	}

	void KeyboardInputs()
	{
		if(Input.GetKeyDown(KeyCode.Keypad0))
		{
			PlaceLayers(0);
		}

		if(Input.GetKeyDown(KeyCode.Keypad1))
		{
			PlaceLayers(1);
		}

		if(Input.GetKeyDown(KeyCode.Keypad2))
		{
			PlaceLayers(2);
		}

		if(Input.GetKeyDown(KeyCode.Keypad3))
		{
			PlaceLayers(3);
		}

		if(Input.GetKeyDown(KeyCode.UpArrow))
		{
			LaunchReorganisation(true);
		}

		if(Input.GetKeyDown(KeyCode.DownArrow))
		{
			LaunchReorganisation(false);
		}

	}

	void LaunchReorganisation(bool moveForward)
	{
		if(reorganising == false)
		{


			if(moveForward)
			{
				motionLayerForward = true;
				//frontIndex = (int)Modulo ((float)(frontIndex-1),(float)listLayers.Length);
				indexToVanish = frontIndex;
			}
			else
			{
				//frontIndex = (int)Modulo ((float)(frontIndex+1),(float)listLayers.Length);
				motionLayerForward = false;
				indexToVanish = (int)Modulo ((float)(frontIndex+3),(float)listLayers.Length);
			}

			reorganising = true;
			vanishing=true;


		}
	}

	void Reorganizing()
	{
		if(reorganising)
		{
			if(vanishing)
			{
				progressVanish=Mathf.Clamp01(progressVanish+Time.deltaTime/durationVanishIn);

				listLayers[indexToVanish].Vanish(progressVanish);




				for(int i = 0; i<listLayers.Length;i++)
				{
					int _i = (int)Modulo((float)(frontIndex+i),(float)listLayers.Length);
					
					
					listLayers[_i].gameObject.transform.position = Vector3.forward*Map ((float)i,0f,(float)(listLayers.Length-1),0f,marginLayers*(float)(listLayers.Length-1))+Vector3.forward*marginLayers*(motionLayerForward?-1f:1f)*progressVanish;
					//listLayers[_i].gameObject.transform.localScale = new Vector3(1f,1f,1f)*Map ((float)i+progressGlobal,(float)0f,(float)(listLayers.Length),11.82f,67.64f);
				}





				if(progressVanish==1f)
				{

				
					if(motionLayerForward)
					{
						//motionLayerForward = true;
						frontIndex = (int)Modulo ((float)(frontIndex+1),(float)listLayers.Length);
						//indexToVanish = frontIndex;
					}
					else
					{
						frontIndex = (int)Modulo ((float)(frontIndex-1),(float)listLayers.Length);
						//motionLayerForward = false;
						//indexToVanish = (int)Modulo ((float)(frontIndex+3),(float)listLayers.Length);
					}




					PlaceLayers(frontIndex);
					vanishing = false;
				}

			}
			else
			{



				progressVanish=Mathf.Clamp01(progressVanish-Time.deltaTime/durationVanishOut);



				listLayers[indexToVanish].Vanish(progressVanish);
				if(progressVanish==0f)
				{
					reorganising = false;
				}
			}



			
			
			
			
			
			





		}







	}



	void PlaceLayers(int _frontIndex)
	{
		for(int i = 0; i<listLayers.Length;i++)
		{
			int _i = (int)Modulo((float)(_frontIndex+i),(float)listLayers.Length);

			listLayers[_i].gameObject.transform.position = Vector3.forward*Map ((float)i,0f,(float)(listLayers.Length-1),0f,marginLayers*(float)(listLayers.Length-1));
			//listLayers[_i].gameObject.transform.localScale = new Vector3(1f,1f,1f)*Map ((float)i,(float)0f,(float)(listLayers.Length-1),11.82f,67.64f);
		}
	}

	void Reorganize()
	{

	}

	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}

	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}

	public void Slider1(float value){	if(catching==false)value1 = value;	}
	public void Slider2(float value){	if(catching==false)value2 = value;	}
	public void Slider3(float value){	if(catching==false)value3 = value;	}
	public void Slider4(float value){	if(catching==false)value4 = value;	}
	public void Slider5(float value){	if(catching==false)value5 = value;	}
	public void Slider6(float value){	if(catching==false)value6 = value;	}
	public void Slider7(float value){	if(catching==false)value7 = value;	}
	public void Slider8(float value){	if(catching==false)value8 = value;	}

	public void GoNextLayer()
	{
		if(catching==false)
		LaunchReorganisation(true);
	}

	public void TryCatchCreature()
	{
		if(reorganising==false)
		{
			listLayers[frontIndex].myCreature.CatchMe();
		}
	}

	public float GetMinDistanceInLoop(Vector2 pointA, Vector2 pointB)
	{
		float distanceMin = 999f;

		for(float i = -1f;i<2f;i++)
		{
			for(float j = -1f;j<2f;j++)
			{
				float newDistance = Vector2.Distance(new Vector2(pointA.x+j,pointA.y+i),pointB);

				if(newDistance<distanceMin)
				{
					distanceMin = newDistance;
				}
			}
		}

		return(distanceMin);

	}

	public void EndCatch()
	{
		catching = false;
		Application.LoadLevel (1);
	}
}
