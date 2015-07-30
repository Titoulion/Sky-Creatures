using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CreatureScript : MonoBehaviour {
	public Vector2 myCoordinate;
	public int myLayer;

	bool apparait = false;
	public float progressApparition = 0f;

	MainScript main;

	public Material myMatBase;

	bool caugth = false;

	float progressCatch = 0f;
	// Use this for initialization

	public List<Material> myMats = new List<Material>();







	public void SetRandomPosition(int layer)
	{
		myLayer = layer;
		myMatBase = Resources.Load("MatSprite"+myLayer.ToString(), typeof(Material)) as Material;

		myCoordinate = new Vector2(Random.value,Random.value);
	}

	void Start () {



		InitMats();


		main = MainScript.Instance;
		//myMat = GetComponent<Renderer>().material;
	}

	void InitMats()
	{
		Renderer[] allMats = GetComponentsInChildren<Renderer>();

		foreach(Renderer rend in allMats)
		{
			//myMats.Add(rend.material);
			rend.material = myMatBase;
		}
	}
	
	// Update is called once per frame
	void Update () 
	{
		//if(main.gameStarted)
		Apparition();


	}



	void Apparition()
	{

			if(main.conclusion)
			{
				progressCatch-=Time.deltaTime*2f;
			}
			else
			{
				if(myLayer==main.frontIndex)
				{
					progressCatch+=Time.deltaTime;
					
					
				}
				else
				{
					progressCatch-=Time.deltaTime;
				}
			}

			

			progressCatch=Mathf.Clamp01(progressCatch);
			SetAlpha (progressCatch);






	}

	public void SetAlpha(float value)
	{
		//myMat.SetFloat("_MyAlpha",value);
		myMatBase.SetColor("_Color",new Color(1f,1f,1f,value));
	}

	public void CatchMe()
	{
		if(progressApparition==1f)
		{
			main.catching = true;
			caugth = true;
		}
	}


	public void Show()
	{
		apparait = true;
	}

	public void Hide()
	{
		apparait = false;
	}
}
