using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using UnityEngine;

#if !UNITY_WEBPLAYER
using System.IO.Ports;
#endif

public class ArduinoInput : SingletonMonoBehaviour<ArduinoInput>
{
    [SerializeField] private int comNumber = 2;
    [SerializeField] private int baudRate = 9600;
    [SerializeField] private bool rtsEnable;
    [SerializeField] private bool dtsEnable;
    [SerializeField] private int readTimeout = 10;
    [SerializeField] private int writeTimeout = 10;
    [SerializeField] private int valuesCount = 2;
    [SerializeField] private int[] closestValuesWithoutTouchingByPin;
    [SerializeField] private int[] indexToPinNumber;
    [SerializeField] private bool saveDebugText;

    private bool[] touchByPin;
    private int[] diffByPin;
    private float[] closenessDistanceByPin;
    private string debugTextString;

    public bool IsDebugTextUpdated { get; private set; }

    private string debugTextStringInternal;
    private bool updatedInternal;
    private bool[] touchByPinInternal;
    private int[] diffByPinInternal;
    private float[] closenessDistanceByPinInternal;

#if !UNITY_WEBPLAYER
    private SerialPort stream;
    private Thread thread;

    private bool quit = false;

    private void Awake()
    {
        //Debug.Log(SerialPort.GetPortNames().ToOneLineString());
        stream = new SerialPort("COM" + comNumber, baudRate);
        stream.RtsEnable = rtsEnable;
        stream.DtrEnable = dtsEnable;
        stream.ReadTimeout = readTimeout;
        stream.WriteTimeout = writeTimeout;
        thread = new Thread(ReadDataThread);

        touchByPin = new bool[valuesCount];
        diffByPin = new int[valuesCount];
        closenessDistanceByPin = new float[valuesCount];

        touchByPinInternal = new bool[valuesCount];
        diffByPinInternal = new int[valuesCount];
        closenessDistanceByPinInternal = new float[valuesCount];
    }

    private void OnEnable()
    {
        quit = false;
        try
        {
            stream.Open();
            if (stream.IsOpen)
            {
                thread.Start();
            }
        }
        catch (IOException exception)
        {
            Debug.LogWarning("Error while connecting to the Arduino: " + exception.Message);
            Debug.Log("Existing ports: " + SerialPort.GetPortNames().ToOneLineString());
        }
    }

    private void OnDisable()
    {
        quit = true;

        /*
        if (stream.IsOpen)
        {
            var data = new byte[4];
            data[0] = 100;
            for (var i = 0; i < data.Length; i++)
            {
                data[i] = 99;
            }
            stream.Write(data, 0, data.Length);
        }
         */

        stream.Close();
        thread.Abort();
    }

    private void Update()
    {
        if (updatedInternal)
        {
            lock (this)
            {
                updatedInternal = false;
                Array.Copy(touchByPinInternal, touchByPin, valuesCount);
                Array.Copy(diffByPinInternal, diffByPin, valuesCount);
                Array.Copy(closenessDistanceByPinInternal, closenessDistanceByPin, valuesCount);

                debugTextString = debugTextStringInternal;
                IsDebugTextUpdated = true;
            }
        }
/*
        if (dataUpdated)
        {
            var number = 0;
            lock (this)
            {
                number = readNumber;
                dataUpdated = false;
            }

            if (number != previousNumber)
            {
                NumberChanged(previousNumber, number);
                previousNumber = number;
            }
        }
     */
    }

    private void ReadDataThread()
    {
        while (!quit)
        {
            Thread.Sleep(0);
            var fullLine = stream.ReadLine();
            if (fullLine.Length <= 0)
                continue;

            updatedInternal = true;

            if (saveDebugText)
            {
                debugTextStringInternal = fullLine.Replace(';', '\n');
            }

            var lines = fullLine.Split(';');

            lock (this)
            {
                foreach (var line in lines)
                {
                    var parts = line.Split(' ');
                    if (parts[0].Equals("TOUCH:"))
                    {
                        for (var i = 0; i < valuesCount; i++)
                        {
                            touchByPinInternal[i] = parts[i + 1].Equals("1");
                        }
                    }
                    else if (parts[0].Equals("DIFF:"))
                    {
                        for (var i = 0; i < valuesCount; i++)
                        {
                            diffByPinInternal[i] = int.Parse(parts[i + 1]);
                            closenessDistanceByPinInternal[i] = Mathf.InverseLerp(0, closestValuesWithoutTouchingByPin[i], diffByPin[i]);
                        }
                    }
                }
            }

            Thread.Sleep(0);
        }
    }
#endif

    public bool IsConnected
    {
        get
        {
#if UNITY_WEBPLAYER
            return false,
#else
            return stream.IsOpen;
#endif
        }
    }

    public string GetDebugTextUpdate()
    {
        IsDebugTextUpdated = false;
        return debugTextString;
    }

    public bool GetTouch(int index)
    {
        return touchByPin[indexToPinNumber[index]];
    }

    public int GetDiff(int index)
    {
        return diffByPin[indexToPinNumber[index]];
    }

    public float GetClosenessDistance(int index)
    {
        return closenessDistanceByPin[indexToPinNumber[index]];
    }
}
