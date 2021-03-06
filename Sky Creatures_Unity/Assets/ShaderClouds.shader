// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:37446,y:32670,varname:node_3138,prsc:2|emission-4780-OUT,alpha-2108-OUT;n:type:ShaderForge.SFN_Tex2d,id:9493,x:33437,y:33538,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_9493,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9656,x:33167,y:33059,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_9656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7042-OUT;n:type:ShaderForge.SFN_Add,id:2819,x:33414,y:33137,varname:node_2819,prsc:2|A-9656-R,B-9493-R;n:type:ShaderForge.SFN_If,id:2051,x:35273,y:32664,varname:node_2051,prsc:2|A-2819-OUT,B-5314-OUT,GT-2950-RGB,EQ-2950-RGB,LT-9664-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5611,x:33764,y:33293,ptovrint:False,ptlb:SizeClouds,ptin:_SizeClouds,varname:node_5611,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_If,id:8862,x:34585,y:33427,varname:node_8862,prsc:2|A-2819-OUT,B-6080-OUT,GT-5298-OUT,EQ-5298-OUT,LT-4293-OUT;n:type:ShaderForge.SFN_Add,id:6080,x:34185,y:33457,varname:node_6080,prsc:2|A-5314-OUT,B-9357-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7942,x:33713,y:33578,ptovrint:False,ptlb:OutlineThickness,ptin:_OutlineThickness,varname:node_7942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:5298,x:34388,y:33501,varname:node_5298,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4293,x:34420,y:33591,varname:node_4293,prsc:2,v1:1;n:type:ShaderForge.SFN_Posterize,id:7612,x:33625,y:32966,varname:node_7612,prsc:2|IN-2819-OUT,STPS-3183-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3183,x:33382,y:32916,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_3183,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:9274,x:33793,y:32883,varname:node_9274,prsc:2|IN-7612-OUT;n:type:ShaderForge.SFN_Color,id:2950,x:34211,y:32135,ptovrint:False,ptlb:ColorOutline,ptin:_ColorOutline,varname:node_2950,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:600,x:31548,y:32854,varname:node_600,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:8484,x:31846,y:33070,varname:node_8484,prsc:2|A-600-UVOUT,B-3131-OUT;n:type:ShaderForge.SFN_Vector2,id:3131,x:31548,y:33095,varname:node_3131,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:5939,x:31843,y:33521,varname:node_5939,prsc:2|A-8484-OUT,B-1995-OUT;n:type:ShaderForge.SFN_Vector1,id:1995,x:31579,y:33501,varname:node_1995,prsc:2,v1:2;n:type:ShaderForge.SFN_ArcTan2,id:1467,x:32455,y:32413,varname:node_1467,prsc:2|A-8994-OUT,B-9046-OUT;n:type:ShaderForge.SFN_Subtract,id:8994,x:31976,y:32270,varname:node_8994,prsc:2|A-600-V,B-8494-OUT;n:type:ShaderForge.SFN_Vector1,id:8494,x:32239,y:32619,varname:node_8494,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:9046,x:31976,y:32398,varname:node_9046,prsc:2|A-600-U,B-8494-OUT;n:type:ShaderForge.SFN_Cos,id:4234,x:32643,y:32243,varname:node_4234,prsc:2|IN-3554-OUT;n:type:ShaderForge.SFN_Sin,id:4412,x:32705,y:32661,varname:node_4412,prsc:2|IN-3554-OUT;n:type:ShaderForge.SFN_Append,id:310,x:32027,y:32731,varname:node_310,prsc:2|A-4234-OUT,B-4412-OUT;n:type:ShaderForge.SFN_Add,id:3554,x:32681,y:32447,varname:node_3554,prsc:2|A-1467-OUT,B-369-OUT;n:type:ShaderForge.SFN_Multiply,id:5528,x:32359,y:32965,varname:node_5528,prsc:2|A-310-OUT,B-5939-OUT,C-4917-OUT,D-2292-OUT;n:type:ShaderForge.SFN_Add,id:7042,x:32946,y:33161,varname:node_7042,prsc:2|A-600-UVOUT,B-5528-OUT;n:type:ShaderForge.SFN_ValueProperty,id:369,x:32488,y:32744,ptovrint:False,ptlb:ValueDistort,ptin:_ValueDistort,varname:node_369,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2292,x:32272,y:33142,ptovrint:False,ptlb:GlobalDistoForce,ptin:_GlobalDistoForce,varname:node_2292,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:8774,x:32005,y:33491,varname:node_8774,prsc:2|IN-5939-OUT;n:type:ShaderForge.SFN_Pi,id:6424,x:32123,y:33817,varname:node_6424,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9270,x:32372,y:33523,varname:node_9270,prsc:2|A-1279-OUT,B-6424-OUT,C-7740-OUT;n:type:ShaderForge.SFN_Vector1,id:7740,x:32234,y:33742,varname:node_7740,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:1279,x:32176,y:33513,varname:node_1279,prsc:2|IN-8774-OUT;n:type:ShaderForge.SFN_Cos,id:4917,x:32565,y:33414,varname:node_4917,prsc:2|IN-9270-OUT;n:type:ShaderForge.SFN_Multiply,id:6167,x:34000,y:33627,varname:node_6167,prsc:2|A-7942-OUT,B-9838-OUT;n:type:ShaderForge.SFN_Vector1,id:9838,x:33768,y:33671,varname:node_9838,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Max,id:9357,x:34145,y:33662,varname:node_9357,prsc:2|A-6167-OUT,B-4717-OUT;n:type:ShaderForge.SFN_Vector1,id:4717,x:34077,y:33748,varname:node_4717,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:6657,x:34619,y:31828,ptovrint:False,ptlb:TextureFeedback,ptin:_TextureFeedback,varname:node_6657,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:1377,x:34655,y:32313,ptovrint:False,ptlb:FeedbackDistance,ptin:_FeedbackDistance,varname:node_1377,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:9664,x:35178,y:32304,varname:node_9664,prsc:2|A-3404-OUT,B-3510-OUT,T-1377-OUT;n:type:ShaderForge.SFN_Blend,id:3510,x:35055,y:32142,varname:node_3510,prsc:2,blmd:13,clmp:True|SRC-3404-OUT,DST-7838-OUT;n:type:ShaderForge.SFN_Posterize,id:7838,x:34893,y:31974,varname:node_7838,prsc:2|IN-6657-RGB,STPS-3183-OUT;n:type:ShaderForge.SFN_Relay,id:3404,x:34355,y:32684,varname:node_3404,prsc:2|IN-7810-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2838,x:32682,y:32056,ptovrint:False,ptlb:TransitionColor,ptin:_TransitionColor,varname:node_2838,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Cos,id:6640,x:32932,y:32272,varname:node_6640,prsc:2|IN-2838-OUT;n:type:ShaderForge.SFN_Lerp,id:7810,x:33991,y:32640,varname:node_7810,prsc:2|A-7756-RGB,B-3106-RGB,T-6513-OUT;n:type:ShaderForge.SFN_Tex2d,id:7756,x:33848,y:32273,ptovrint:False,ptlb:RampA,ptin:_RampA,varname:node_7756,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8718-OUT;n:type:ShaderForge.SFN_Tex2d,id:3106,x:33816,y:32457,ptovrint:False,ptlb:RampB,ptin:_RampB,varname:node_3106,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8718-OUT;n:type:ShaderForge.SFN_Append,id:8718,x:33563,y:32693,varname:node_8718,prsc:2|A-9274-OUT,B-1666-OUT;n:type:ShaderForge.SFN_Vector1,id:1666,x:33682,y:32737,varname:node_1666,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:1019,x:33104,y:32006,varname:node_1019,prsc:2|A-6640-OUT,B-9934-OUT;n:type:ShaderForge.SFN_Vector1,id:9934,x:32944,y:32121,varname:node_9934,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:9670,x:33292,y:32038,varname:node_9670,prsc:2|A-1019-OUT,B-794-OUT;n:type:ShaderForge.SFN_Vector1,id:794,x:33136,y:32272,varname:node_794,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Relay,id:6513,x:33658,y:32149,varname:node_6513,prsc:2|IN-9327-OUT;n:type:ShaderForge.SFN_Tex2d,id:7570,x:33189,y:31512,ptovrint:False,ptlb:TextureColorTransition,ptin:_TextureColorTransition,varname:node_7570,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:3017,x:33658,y:31563,varname:node_3017,prsc:2|A-3907-OUT,B-5083-OUT;n:type:ShaderForge.SFN_Clamp01,id:9327,x:33860,y:31643,varname:node_9327,prsc:2|IN-3017-OUT;n:type:ShaderForge.SFN_Posterize,id:3907,x:33449,y:31516,varname:node_3907,prsc:2|IN-7570-R,STPS-5769-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:33288,y:31711,varname:node_5083,prsc:2|IN-9670-OUT,IMIN-5998-OUT,IMAX-883-OUT,OMIN-9218-OUT,OMAX-6509-OUT;n:type:ShaderForge.SFN_Vector1,id:5998,x:33127,y:31711,varname:node_5998,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:883,x:33115,y:31742,varname:node_883,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:9218,x:32962,y:31813,ptovrint:False,ptlb:remapTransitionMin,ptin:_remapTransitionMin,varname:node_9218,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:6509,x:32977,y:31742,ptovrint:False,ptlb:remapTransitionMax,ptin:_remapTransitionMax,varname:node_6509,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:5769,x:33368,y:31658,ptovrint:False,ptlb:posterizeTransition,ptin:_posterizeTransition,varname:node_5769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Slider,id:2048,x:33634,y:33438,ptovrint:False,ptlb:ProgressIntro,ptin:_ProgressIntro,varname:node_2048,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:5314,x:33944,y:33369,varname:node_5314,prsc:2|A-5611-OUT,B-2048-OUT;n:type:ShaderForge.SFN_TexCoord,id:1694,x:35593,y:32393,varname:node_1694,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:6382,x:35703,y:32559,varname:node_6382,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:8291,x:35836,y:32416,varname:node_8291,prsc:2|A-1694-UVOUT,B-6382-OUT;n:type:ShaderForge.SFN_If,id:4067,x:36351,y:32426,varname:node_4067,prsc:2|A-8291-OUT,B-7221-OUT,GT-1103-OUT,EQ-1103-OUT,LT-2051-OUT;n:type:ShaderForge.SFN_Vector3,id:460,x:35874,y:32595,varname:node_460,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_If,id:2610,x:36206,y:33026,varname:node_2610,prsc:2|A-8291-OUT,B-9062-OUT,GT-4408-OUT,EQ-8862-OUT,LT-8862-OUT;n:type:ShaderForge.SFN_Vector1,id:4408,x:35729,y:33055,varname:node_4408,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:1103,x:36089,y:32639,varname:node_1103,prsc:2|A-2051-OUT,B-460-OUT,T-1668-OUT;n:type:ShaderForge.SFN_Clamp01,id:1668,x:36636,y:32498,varname:node_1668,prsc:2|IN-6474-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7221,x:36176,y:32317,ptovrint:False,ptlb:RayonCircle,ptin:_RayonCircle,varname:node_7221,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.45;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:6474,x:36502,y:32209,varname:node_6474,prsc:2|IN-8291-OUT,IMIN-7221-OUT,IMAX-9784-OUT,OMIN-4370-OUT,OMAX-3304-OUT;n:type:ShaderForge.SFN_Vector1,id:9784,x:36642,y:32283,varname:node_9784,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:4370,x:36710,y:32365,varname:node_4370,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:3304,x:36814,y:32442,varname:node_3304,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:9062,x:36224,y:32801,varname:node_9062,prsc:2|A-7221-OUT,B-5123-OUT;n:type:ShaderForge.SFN_Vector1,id:5123,x:36015,y:32828,varname:node_5123,prsc:2,v1:0.05;n:type:ShaderForge.SFN_Tex2d,id:6881,x:36148,y:33256,ptovrint:False,ptlb:TextureCloseClouds,ptin:_TextureCloseClouds,varname:node_6881,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:3974,x:36589,y:33246,varname:node_3974,prsc:2|A-1545-OUT,B-4908-OUT;n:type:ShaderForge.SFN_Slider,id:7955,x:36308,y:33442,ptovrint:False,ptlb:ProgressCloseClouds,ptin:_ProgressCloseClouds,varname:node_7955,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRange,id:4908,x:36629,y:33386,varname:node_4908,prsc:2,frmn:0,frmx:1,tomn:1,tomx:-1|IN-7955-OUT;n:type:ShaderForge.SFN_Clamp01,id:1477,x:36739,y:33268,varname:node_1477,prsc:2|IN-3974-OUT;n:type:ShaderForge.SFN_Lerp,id:4780,x:37191,y:33042,varname:node_4780,prsc:2|A-4209-OUT,B-4067-OUT,T-1477-OUT;n:type:ShaderForge.SFN_Vector3,id:4209,x:36965,y:33030,varname:node_4209,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Lerp,id:2108,x:36903,y:33149,varname:node_2108,prsc:2|A-1810-OUT,B-2610-OUT,T-1477-OUT;n:type:ShaderForge.SFN_Vector1,id:1810,x:36646,y:33161,varname:node_1810,prsc:2,v1:1;n:type:ShaderForge.SFN_Posterize,id:1545,x:36402,y:33288,varname:node_1545,prsc:2|IN-6881-R,STPS-8912-OUT;n:type:ShaderForge.SFN_Vector1,id:8912,x:36288,y:33351,varname:node_8912,prsc:2,v1:15;proporder:9493-9656-3183-7942-5611-2950-369-2292-6657-1377-2838-7756-3106-7570-9218-6509-5769-2048-7221-6881-7955;pass:END;sub:END;*/

Shader "Shader Forge/ShaderClouds" {
    Properties {
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Perlin4 ("Perlin4", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Float ) = 0
        _OutlineThickness ("OutlineThickness", Float ) = 0
        _SizeClouds ("SizeClouds", Float ) = 0
        _ColorOutline ("ColorOutline", Color) = (0.5,0.5,0.5,1)
        _ValueDistort ("ValueDistort", Float ) = 0
        _GlobalDistoForce ("GlobalDistoForce", Float ) = 0
        _TextureFeedback ("TextureFeedback", 2D) = "white" {}
        _FeedbackDistance ("FeedbackDistance", Range(0, 1)) = 0
        _TransitionColor ("TransitionColor", Float ) = 0
        _RampA ("RampA", 2D) = "white" {}
        _RampB ("RampB", 2D) = "white" {}
        _TextureColorTransition ("TextureColorTransition", 2D) = "white" {}
        _remapTransitionMin ("remapTransitionMin", Float ) = 0
        _remapTransitionMax ("remapTransitionMax", Float ) = 0
        _posterizeTransition ("posterizeTransition", Float ) = 0
        _ProgressIntro ("ProgressIntro", Range(0, 1)) = 0
        _RayonCircle ("RayonCircle", Float ) = 0.45
        _TextureCloseClouds ("TextureCloseClouds", 2D) = "white" {}
        _ProgressCloseClouds ("ProgressCloseClouds", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform sampler2D _Perlin4; uniform float4 _Perlin4_ST;
            uniform float _SizeClouds;
            uniform float _OutlineThickness;
            uniform float _PosterizeStrength;
            uniform float4 _ColorOutline;
            uniform float _ValueDistort;
            uniform float _GlobalDistoForce;
            uniform sampler2D _TextureFeedback; uniform float4 _TextureFeedback_ST;
            uniform float _FeedbackDistance;
            uniform float _TransitionColor;
            uniform sampler2D _RampA; uniform float4 _RampA_ST;
            uniform sampler2D _RampB; uniform float4 _RampB_ST;
            uniform sampler2D _TextureColorTransition; uniform float4 _TextureColorTransition_ST;
            uniform float _remapTransitionMin;
            uniform float _remapTransitionMax;
            uniform float _posterizeTransition;
            uniform float _ProgressIntro;
            uniform float _RayonCircle;
            uniform sampler2D _TextureCloseClouds; uniform float4 _TextureCloseClouds_ST;
            uniform float _ProgressCloseClouds;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float node_8291 = distance(i.uv0,float2(0.5,0.5));
                float node_4067_if_leA = step(node_8291,_RayonCircle);
                float node_4067_if_leB = step(_RayonCircle,node_8291);
                float node_8494 = 0.5;
                float node_3554 = (atan2((i.uv0.g-node_8494),(i.uv0.r-node_8494))+_ValueDistort);
                float node_5939 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float2 node_7042 = (i.uv0+(float2(cos(node_3554),sin(node_3554))*node_5939*cos(((1.0 - saturate(node_5939))*3.141592654*0.5))*_GlobalDistoForce));
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(node_7042, _Perlin4));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float node_2819 = (_Perlin4_var.r+_Perlin3_var.r);
                float node_5314 = (_SizeClouds*_ProgressIntro);
                float node_2051_if_leA = step(node_2819,node_5314);
                float node_2051_if_leB = step(node_5314,node_2819);
                float2 node_8718 = float2(saturate(floor(node_2819 * _PosterizeStrength) / (_PosterizeStrength - 1)),0.5);
                float4 _RampA_var = tex2D(_RampA,TRANSFORM_TEX(node_8718, _RampA));
                float4 _RampB_var = tex2D(_RampB,TRANSFORM_TEX(node_8718, _RampB));
                float4 _TextureColorTransition_var = tex2D(_TextureColorTransition,TRANSFORM_TEX(i.uv0, _TextureColorTransition));
                float node_5998 = 0.0;
                float3 node_3404 = lerp(_RampA_var.rgb,_RampB_var.rgb,saturate((floor(_TextureColorTransition_var.r * _posterizeTransition) / (_posterizeTransition - 1)+(_remapTransitionMin + ( (((cos(_TransitionColor)+1.0)*0.5) - node_5998) * (_remapTransitionMax - _remapTransitionMin) ) / (1.0 - node_5998)))));
                float4 _TextureFeedback_var = tex2D(_TextureFeedback,TRANSFORM_TEX(i.uv0, _TextureFeedback));
                float3 node_2051 = lerp((node_2051_if_leA*lerp(node_3404,saturate(( node_3404 > 0.5 ? (floor(_TextureFeedback_var.rgb * _PosterizeStrength) / (_PosterizeStrength - 1)/((1.0-node_3404)*2.0)) : (1.0-(((1.0-floor(_TextureFeedback_var.rgb * _PosterizeStrength) / (_PosterizeStrength - 1))*0.5)/node_3404)))),_FeedbackDistance))+(node_2051_if_leB*_ColorOutline.rgb),_ColorOutline.rgb,node_2051_if_leA*node_2051_if_leB);
                float node_4370 = 0.0;
                float3 node_1103 = lerp(node_2051,float3(0,0,0),saturate((node_4370 + ( (node_8291 - _RayonCircle) * (1.0 - node_4370) ) / (0.5 - _RayonCircle))));
                float4 _TextureCloseClouds_var = tex2D(_TextureCloseClouds,TRANSFORM_TEX(i.uv0, _TextureCloseClouds));
                float node_8912 = 15.0;
                float node_1477 = saturate((floor(_TextureCloseClouds_var.r * node_8912) / (node_8912 - 1)+(_ProgressCloseClouds*-2.0+1.0)));
                float3 emissive = lerp(float3(0,0,0),lerp((node_4067_if_leA*node_2051)+(node_4067_if_leB*node_1103),node_1103,node_4067_if_leA*node_4067_if_leB),node_1477);
                float3 finalColor = emissive;
                float node_2610_if_leA = step(node_8291,(_RayonCircle+0.05));
                float node_2610_if_leB = step((_RayonCircle+0.05),node_8291);
                float node_8862_if_leA = step(node_2819,(node_5314+max((_OutlineThickness*0.01),0.0)));
                float node_8862_if_leB = step((node_5314+max((_OutlineThickness*0.01),0.0)),node_2819);
                float node_5298 = 0.0;
                float node_8862 = lerp((node_8862_if_leA*1.0)+(node_8862_if_leB*node_5298),node_5298,node_8862_if_leA*node_8862_if_leB);
                float node_2610 = lerp((node_2610_if_leA*node_8862)+(node_2610_if_leB*1.0),node_8862,node_2610_if_leA*node_2610_if_leB);
                return fixed4(finalColor,lerp(1.0,node_2610,node_1477));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
