using UnityEngine;
using System.Collections;

public class CreatureScript : MonoBehaviour {
	public Vector2 myCoordinate;
	public int myLayer;

	bool apparait = false;
	float progressApparition = 0f;

	MainScript main;

	Material myMat;

	bool caugth = false;

	float progressCatch = 0f;
	// Use this for initialization
	void Start () {
		main = MainScript.Instance;
		myMat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () 
	{
		Apparition();
		Attrape();

	}

	void Attrape()
	{
		if(caugth)
		{
			progressCatch+=Time.deltaTime;

			progressCatch=Mathf.Clamp01(progressCatch);

			transform.localScale = Mathf.Lerp(1f,10f,progressCatch)*new Vector3(30f,57f,1f)*0.1f;
			SetAlpha (1f-progressCatch);

			if(progressCatch==1f)
			{
				main.EndCatch();
			}
		}
	}

	void Apparition()
	{


		if(caugth==false)
		{
			if(!apparait)
			{
				progressApparition-=Time.deltaTime/0.5f;
			}
			else
			{
				progressApparition+=Time.deltaTime/0.5f;
			}
			
			
			progressApparition = Mathf.Clamp01(progressApparition);
			
			transform.localScale = Mathf.Lerp(0f,1f,progressApparition)*new Vector3(30f,57f,1f)*0.1f;
		}



	}

	public void SetAlpha(float value)
	{
		myMat.SetFloat("_MyAlpha",value);
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
