using UnityEngine;
using System.Collections;

public class CircleMotion : MonoBehaviour {


	public float rayon = 1f;
	public float speed = 1f;
	public float progress = 0f;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	

		progress+=Time.deltaTime*speed;

		Vector3 pos = Vector3.zero;
		pos.z = transform.position.z;
		pos.x+=Mathf.Cos (progress)*rayon;
		pos.y+=Mathf.Sin (progress)*rayon;

		transform.position = pos;


	}
}
