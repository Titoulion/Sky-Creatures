using UnityEngine;
using System.Collections;
using UnityStandardAssets.ImageEffects;


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

	public AnimationCurve curveCreatureFeedback;

	bool tryingToCatch = false;
	float progressCatch = 0f;
	public AnimationCurve curveEffectCatch;
	bool catchingCreature = false;

	public AnimationCurve curveSizeCatchingCreature;

	public AnimationCurve curveFeedback;

	public float distanceMaxToCatch = 0.1f;


	public bool gameStarted =false;



	public Texture2D fadeOutTexture;
	public float fadeSpeed = 0.2f;
	
	private int drawDepth = -1000;
	
	private float alphaFade = 1.0f; 
	
	private float fadeDir = -1.0f;

	bool endGame = false;

	NetworkConnection network;

	bool introduction =false;
	OSCPureDataConnection OSCStuff;



	void Awake()
	{
		network = GameObject.FindObjectOfType<NetworkConnectionPlayerIO>();
		Instance = this;
	}

	void Start () 
	{
		//CreatureCreator.Instance.




		inputArduino = ArduinoInput.Instance;
		OSCStuff = OSCPureDataConnection.Instance;

		InstantiateCreature();
		isCreatuePresent = true;


		//PlaceLayers(frontIndex);
	}

	void InstantiateCreature()
	{
		listCreatures = new CreatureScript[listLayers.Length];


		int[] seeds = new int[3];



		for(int i = 0; i<listLayers.Length;i++)
		{



			Creature newMob = CreatureCreator.Instance.SpawnRandom();
			
			newMob.gameObject.AddComponent<CreatureScript>();

			CreatureScript newCreature = newMob.GetComponent<CreatureScript>();

			listLayers[i].SetMyCreature(newCreature);

			seeds[i] = newMob.Seed;



		}


		//StartCoroutine(WaitAndSpawn(seeds));
		network.SendSpawnCreatures(seeds);





	}

	//IEnumerator WaitAndSpawn(int[] seeds)
	//{
	//	yield return new WaitForSeconds(3f);

	//}


	
	// Update is called once per frame
	void Update () 
	{


		KeyboardInputs();




		GetArduinoInputs();



		Reorganizing();


		UpdateValuesDistance();


		EffectCatch();





		if(Input.GetKeyDown(KeyCode.R))
		{
			Application.LoadLevel("MainScene");
		}
	


		GestionSound();



	}

	void GestionSound()
	{
		OSCStuff.SendDirections(inputArduino.GetClosenessDistance(1),inputArduino.GetClosenessDistance(0),inputArduino.GetClosenessDistance(3),inputArduino.GetClosenessDistance(2));
	}

	void GetArduinoInputs()
	{
		if(inputArduino.GetTouch(5))
		{
			if(previousStateTouchNextLayer==false)
			{
				//GoNextLayer();
				previousStateTouchNextLayer = true;
			}


		}
		else
		{
			previousStateTouchNextLayer = false;




		}


		if(useArduino)
		{
			if(inputArduino.GetTouch(4))
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
				//nothingToCatch.GetComponent<Renderer>().enabled = false;
			}
		}
		else
		{
			if(Input.GetKeyDown(KeyCode.Return))
			{

					TryCatchCreature();

			}

		}





		if(useArduino)
		{
			Slider3(inputArduino.GetClosenessDistance(0));
			Slider4(inputArduino.GetClosenessDistance(1));
			Slider5(inputArduino.GetClosenessDistance(2));
			Slider6(inputArduino.GetClosenessDistance(3));
		}

	


	}

	void UpdateValuesDistance()
	{
		if(CanChangeValues())
		{

		



		float transitionColorSpeed = (value4-value3)*0.05f;
		listLayers[frontIndex].SetTransitionColor(transitionColorSpeed);


		float sensDistort = (value6-value5)*0.04f;
		listLayers[frontIndex].SetValueDistort(sensDistort);





		//for(int i = 0; i<listLayers.Length;i++)
		//{

		int i = frontIndex;

				CreatureScript layerCreature = listLayers[i].myCreature;

				Vector2 pointB = new Vector2(Modulo(layerCreature.myCoordinate.x,1f),Modulo(layerCreature.myCoordinate.y,1f));
				Vector2 pointA = new Vector2(listLayers[i].GetValueX(),listLayers[i].GetValueY());

				float distance = GetMinDistanceInLoop(pointA,pointB);

				
				float feedbackValue = (distance>distanceCreatureMax ?0f:1f-(distance/distanceCreatureMax ));

				listLayers[i].SetValueFeedbackDistance(curveFeedback.Evaluate(feedbackValue));

				
				OSCStuff.SendCreatureProximity(feedbackValue);
				

	//	}


		}
		


	}

	void KeyboardInputs()
	{
		if(Input.GetKeyDown(KeyCode.Keypad0))
		{
			//PlaceLayers(0);
			OSCStuff.SendLayer(0);
		}

		if(Input.GetKeyDown(KeyCode.Keypad1))
		{
			//PlaceLayers(1);
			OSCStuff.SendLayer(1);
		}

		if(Input.GetKeyDown(KeyCode.Keypad2))
		{
			//PlaceLayers(2);
			OSCStuff.SendLayer(2);
		}

		if(Input.GetKeyDown(KeyCode.Keypad3))
		{
			//PlaceLayers(3);
		}

		if(Input.GetKeyDown(KeyCode.UpArrow))
		{
			//LaunchReorganisation(true);
		}

		if(Input.GetKeyDown(KeyCode.DownArrow))
		{
			//LaunchReorganisation(false);
		}

		if(Input.GetKeyDown(KeyCode.Escape))
		{
			Application.Quit();
		}


		if(Input.GetKeyDown(KeyCode.C))
		{
			string theCode = "";

			for(int i =0;i<6;i++)
			{
				theCode+=Random.Range (0,6).ToString();
			}

			Debug.Log (theCode);

			OSCStuff.SendCreatureCode(Random.Range(0,6));
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

				//listLayers[indexToVanish].Vanish(progressVanish);


				for(int i = 0; i<listLayers.Length;i++)
				{
					int _i = (int)Modulo((float)(frontIndex+i),(float)listLayers.Length);
					
					
					//listLayers[_i].gameObject.transform.position = Vector3.forward*Map ((float)i,0f,(float)(listLayers.Length-1),0f,marginLayers*(float)(listLayers.Length-1))+Vector3.forward*marginLayers*(motionLayerForward?-1f:1f)*progressVanish;
					//listLayers[_i].gameObject.transform.localScale = new Vector3(1f,1f,1f)*Map ((float)i+progressGlobal,(float)0f,(float)(listLayers.Length),11.82f,67.64f);
				}

				if(progressVanish==1f)
				{

				
					if(motionLayerForward)
					{
						//motionLayerForward = true;

						if(frontIndex+1==listLayers.Length)
						{
							StartCoroutine(GoFadeOut());
							endGame=true;
						}
						else
						{
							frontIndex = (int)Modulo ((float)(frontIndex+1),(float)listLayers.Length);
						}






						//indexToVanish = frontIndex;
					}
					else
					{
						frontIndex = (int)Modulo ((float)(frontIndex-1),(float)listLayers.Length);
						//motionLayerForward = false;
						//indexToVanish = (int)Modulo ((float)(frontIndex+3),(float)listLayers.Length);
					}


					//PlaceLayers(frontIndex);
					vanishing = false;


				}

			}
			else
			{



				progressVanish=Mathf.Clamp01(progressVanish-Time.deltaTime/durationVanishOut);



				//listLayers[indexToVanish].Vanish(progressVanish);
				if(progressVanish==0f)
				{
					reorganising = false;
					catching = false;
					tryingToCatch = false;



				}

			
			}



		}

	}

	IEnumerator GoFadeOut()
	{
		yield return new WaitForSeconds(2f);
		fadeOut();
	}

	IEnumerator GoRestart()
	{
		yield return new WaitForSeconds(2f);
		Application.LoadLevel("MainScene");
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

	public void Slider1(float value){	if(CanChangeValues())value1 = value;	}
	public void Slider2(float value){	if(CanChangeValues())value2 = value;	}
	public void Slider3(float value){	if(CanChangeValues())value3 = value;	}
	public void Slider4(float value){	if(CanChangeValues())value4 = value;	}
	public void Slider5(float value){	if(CanChangeValues())value5 = value;	}
	public void Slider6(float value){	if(CanChangeValues())value6 = value;	}
	public void Slider7(float value){	if(CanChangeValues())value7 = value;	}
	public void Slider8(float value){	if(CanChangeValues())value8 = value;	}

	public bool CanChangeValues()
	{
		return(tryingToCatch==false && catching == false && reorganising == false && gameStarted && endGame==false);
	}

	public void GoNextLayer()
	{
		LaunchReorganisation(true);
	}

	IEnumerator LaunchIntroduction()
	{
		network.SendCreaturesFlyAway();
		yield return new WaitForSeconds(2f);
		gameStarted = true;
		introduction = false;
	}



	public void TryCatchCreature()
	{
		if(Time.timeSinceLevelLoad>1f && introduction==false)
		{
			if(gameStarted==false)
			{

				Debug.Log ("game starting");

				introduction = true;
				StartCoroutine(LaunchIntroduction());








			}
			else
			{
				if(CanChangeValues())
				{
					
					
					listLayers[frontIndex].myCreature.CatchMe();
					
					CloudsLayerScript currentLayer = listLayers[frontIndex];
					CreatureScript currentCreature = currentLayer.myCreature;
					
					Vector2 posCreature = currentCreature.myCoordinate;
					Vector2 posInLayer = new Vector2(currentLayer.GetValueX(),currentLayer.GetValueY());
					
					if(GetMinDistanceInLoop(posCreature,posInLayer)<distanceMaxToCatch)
					{
						
						Destroy (currentCreature.GetComponentInChildren<CreaturePartMovementCenterGravity>());
						catchingCreature = true;

						network.SendCreatureCaught(currentCreature.GetComponent<Creature>().Seed);
						
						
					}
					else
					{
						catchingCreature = false;
						
					}

					OSCStuff.SendCreatureCatch(catchingCreature);
					
					tryingToCatch = true;
					catching = true;
					
					
				}
			}
		}

	}

	IEnumerator GoAndChangeLayer()
	{
		yield return new WaitForSeconds(1f);
		GoNextLayer ();


	}

	void EffectCatch()
	{
		if(tryingToCatch)
		{
			progressCatch+=Time.deltaTime/3f;
			progressCatch = Mathf.Clamp01(progressCatch);

			Camera.main.GetComponent<Vortex>().angle = curveEffectCatch.Evaluate(progressCatch)*(catchingCreature?900f:300f);


			CloudsLayerScript currentLayer = listLayers[frontIndex];
			CreatureScript currentCreature = currentLayer.myCreature;

			if(catchingCreature)
			{
				currentCreature.gameObject.transform.localScale = Vector3.one*6f*(curveSizeCatchingCreature.Evaluate(progressCatch));



				currentCreature.gameObject.transform.position = Vector3.Lerp(currentCreature.gameObject.transform.localPosition,new Vector3(0f,-17f,-1.83f),0.05f);

			}

			if(progressCatch==1f)
			{
				progressCatch = 0f;
				tryingToCatch = false;


				if(catchingCreature)
				{
					StartCoroutine(GoAndChangeLayer());
				}
				else
				{
					catching = false;
				}

			}



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

	}


	void OnGUI()
	{
		if(Time.timeSinceLevelLoad>1f)
		{
			alphaFade += fadeDir * fadeSpeed * Time.deltaTime;

			if(alphaFade>1f && fadeDir == 1f)
			{
				StartCoroutine(GoRestart());
			}
		}
			
		
		alphaFade = Mathf.Clamp01(alphaFade);	
		
		Color col;
		col = new Color(1.0f,1.0f,1.0f,alphaFade);
		
		
		GUI.color = col;
		
		GUI.depth = drawDepth;
		
		GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), fadeOutTexture);
	}

	public void fadeIn(){
		fadeDir = -1.0f;	
	}
	

	
	public void fadeOut(){
		fadeDir = 1.0f;	

		network.SendRemoveCreatures();

	}

}
