// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:1,cusa:True,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:True,tesm:0,culm:2,bsrc:0,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1873,x:36048,y:32319,varname:node_1873,prsc:2|emission-1086-OUT,alpha-603-OUT;n:type:ShaderForge.SFN_Multiply,id:1086,x:35724,y:32328,cmnt:RGB,varname:node_1086,prsc:2|A-9042-OUT,B-5983-RGB,C-603-OUT;n:type:ShaderForge.SFN_Color,id:5983,x:34890,y:32560,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:603,x:35401,y:32622,cmnt:A,varname:node_603,prsc:2|A-2434-A,B-5983-A;n:type:ShaderForge.SFN_Lerp,id:588,x:33148,y:32706,varname:node_588,prsc:2|A-4149-OUT,B-8906-A,T-6688-OUT;n:type:ShaderForge.SFN_Clamp01,id:6688,x:32760,y:32748,varname:node_6688,prsc:2|IN-9896-OUT;n:type:ShaderForge.SFN_Vector1,id:4149,x:33083,y:32319,varname:node_4149,prsc:2,v1:0;n:type:ShaderForge.SFN_Code,id:8712,x:33832,y:32168,varname:node_8712,prsc:2,code:aQBmACgAYQBsAHAAaABhADEAPgA9AG0AYQByAGcAaQBuAEEAbABwAGgAYQAmACYAYQBsAHAAaABhADIAPABtAGEAcgBnAGkAbgBBAGwAcABoAGEAKQAKAHsACgByAGUAdAB1AHIAbgAoAGYAbABvAGEAdAA0ACgAYwBvAGwAbwByAE8AdQB0AGwAaQBuAGUALgB4ACwAYwBvAGwAbwByAE8AdQB0AGwAaQBuAGUALgB5ACwAYwBvAGwAbwByAE8AdQB0AGwAaQBuAGUALgB6ACwAYQBsAHAAaABhADEAKQApADsACgB9AAoAZQBsAHMAZQAKAHsACgByAGUAdAB1AHIAbgAoAGYAbABvAGEAdAA0ACgAYwBvAGwAbwByAEIAYQBzAGUALgB4ACwAYwBvAGwAbwByAEIAYQBzAGUALgB5ACwAYwBvAGwAbwByAEIAYQBzAGUALgB6ACwAYQBsAHAAaABhADIAKQApADsACgB9AA==,output:3,fname:Function_node_8712,width:696,height:175,input:0,input:0,input:2,input:2,input:0,input_1_label:alpha1,input_2_label:alpha2,input_3_label:colorOutline,input_4_label:colorBase,input_5_label:marginAlpha|A-8327-OUT,B-588-OUT,C-9890-RGB,D-8906-RGB,E-176-OUT;n:type:ShaderForge.SFN_Color,id:9890,x:32486,y:32059,ptovrint:False,ptlb:ColorOutline,ptin:_ColorOutline,varname:node_9890,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ComponentMask,id:2434,x:34945,y:32295,varname:node_2434,prsc:2,cc1:0,cc2:1,cc3:2,cc4:3|IN-8712-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9042,x:35189,y:32295,varname:node_9042,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-2434-OUT;n:type:ShaderForge.SFN_ValueProperty,id:176,x:33543,y:32079,ptovrint:False,ptlb:MarginAlpha,ptin:_MarginAlpha,varname:node_176,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:8327,x:33441,y:32035,varname:node_8327,prsc:2|A-4149-OUT,B-8906-A,T-3792-OUT;n:type:ShaderForge.SFN_Posterize,id:9896,x:32654,y:32904,varname:node_9896,prsc:2|IN-720-OUT,STPS-8544-OUT;n:type:ShaderForge.SFN_Vector1,id:8544,x:32654,y:33072,varname:node_8544,prsc:2,v1:2;n:type:ShaderForge.SFN_Clamp01,id:3792,x:33932,y:33593,varname:node_3792,prsc:2|IN-4170-OUT;n:type:ShaderForge.SFN_Posterize,id:4170,x:33483,y:33453,varname:node_4170,prsc:2|IN-8401-OUT,STPS-5979-OUT;n:type:ShaderForge.SFN_Vector1,id:5979,x:33537,y:33737,varname:node_5979,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:8486,x:32401,y:34010,varname:node_8486,prsc:2|A-4257-OUT,B-5878-OUT;n:type:ShaderForge.SFN_Tex2d,id:8906,x:32403,y:32384,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8906,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ScreenPos,id:1194,x:27848,y:32915,varname:node_1194,prsc:2,sctp:1;n:type:ShaderForge.SFN_Add,id:5060,x:31295,y:32886,varname:node_5060,prsc:2|A-3280-R,B-7164-R;n:type:ShaderForge.SFN_ValueProperty,id:8050,x:31567,y:33106,ptovrint:False,ptlb:SizeClouds,ptin:_SizeClouds,varname:node_5611,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:4257,x:31980,y:33757,varname:node_4257,prsc:2|A-8050-OUT,B-5313-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8575,x:31178,y:33472,ptovrint:False,ptlb:OutlineThickness,ptin:_OutlineThickness,varname:node_7942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:7480,x:32277,y:33673,varname:node_7480,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:665,x:32333,y:33783,varname:node_665,prsc:2,v1:1;n:type:ShaderForge.SFN_Distance,id:151,x:29236,y:33313,varname:node_151,prsc:2|A-1194-UVOUT,B-274-OUT;n:type:ShaderForge.SFN_Multiply,id:139,x:29233,y:33764,varname:node_139,prsc:2|A-151-OUT,B-657-OUT;n:type:ShaderForge.SFN_Vector1,id:657,x:28969,y:33744,varname:node_657,prsc:2,v1:2;n:type:ShaderForge.SFN_ArcTan2,id:4030,x:29579,y:32479,varname:node_4030,prsc:2|A-989-OUT,B-5820-OUT;n:type:ShaderForge.SFN_Subtract,id:989,x:29313,y:32541,varname:node_989,prsc:2|A-1194-V,B-1320-OUT;n:type:ShaderForge.SFN_Vector1,id:1320,x:28923,y:32539,varname:node_1320,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:5820,x:29272,y:32329,varname:node_5820,prsc:2|A-1194-U,B-1320-OUT;n:type:ShaderForge.SFN_Cos,id:5920,x:30105,y:32350,varname:node_5920,prsc:2|IN-543-OUT;n:type:ShaderForge.SFN_Sin,id:8359,x:30223,y:32698,varname:node_8359,prsc:2|IN-543-OUT;n:type:ShaderForge.SFN_Append,id:9444,x:29389,y:32846,varname:node_9444,prsc:2|A-5920-OUT,B-8359-OUT;n:type:ShaderForge.SFN_Add,id:543,x:29807,y:32479,varname:node_543,prsc:2|A-4030-OUT,B-1901-OUT;n:type:ShaderForge.SFN_Multiply,id:5775,x:29782,y:33320,varname:node_5775,prsc:2|A-9444-OUT,B-139-OUT,C-3287-OUT,D-5634-OUT;n:type:ShaderForge.SFN_Add,id:2204,x:30355,y:32961,varname:node_2204,prsc:2|A-1194-UVOUT,B-5775-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1901,x:29784,y:32354,ptovrint:False,ptlb:ValueDistortB,ptin:_ValueDistortB,varname:node_369,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:5634,x:29523,y:33364,ptovrint:False,ptlb:GlobalDistoForceB,ptin:_GlobalDistoForceB,varname:node_2292,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:2094,x:29395,y:33734,varname:node_2094,prsc:2|IN-139-OUT;n:type:ShaderForge.SFN_Pi,id:3994,x:29513,y:34060,varname:node_3994,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8150,x:29762,y:33766,varname:node_8150,prsc:2|A-2426-OUT,B-3994-OUT,C-7829-OUT;n:type:ShaderForge.SFN_Vector1,id:7829,x:29624,y:33985,varname:node_7829,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:2426,x:29566,y:33756,varname:node_2426,prsc:2|IN-2094-OUT;n:type:ShaderForge.SFN_Cos,id:3287,x:29955,y:33657,varname:node_3287,prsc:2|IN-8150-OUT;n:type:ShaderForge.SFN_Multiply,id:8567,x:31309,y:33563,varname:node_8567,prsc:2|A-8575-OUT,B-3473-OUT;n:type:ShaderForge.SFN_Vector1,id:3473,x:31153,y:33627,varname:node_3473,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Max,id:5313,x:31571,y:33635,varname:node_5313,prsc:2|A-8567-OUT,B-5382-OUT;n:type:ShaderForge.SFN_Vector1,id:5382,x:31590,y:33527,varname:node_5382,prsc:2,v1:0;n:type:ShaderForge.SFN_If,id:720,x:32626,y:33444,varname:node_720,prsc:2|A-5060-OUT,B-4257-OUT,GT-7480-OUT,EQ-7480-OUT,LT-665-OUT;n:type:ShaderForge.SFN_Tex2d,id:3280,x:30769,y:32908,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_3280,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2204-OUT;n:type:ShaderForge.SFN_Tex2d,id:7164,x:30837,y:33381,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_7164,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1194-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:5878,x:32155,y:33941,ptovrint:False,ptlb:PrevOutline,ptin:_PrevOutline,varname:node_5878,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_If,id:8401,x:32665,y:33861,varname:node_8401,prsc:2|A-5060-OUT,B-8486-OUT,GT-7480-OUT,EQ-7480-OUT,LT-665-OUT;n:type:ShaderForge.SFN_Vector2,id:274,x:28907,y:33437,varname:node_274,prsc:2,v1:0.5,v2:0.5;proporder:8906-5983-9890-176-8050-8575-1901-5634-7164-3280-5878;pass:END;sub:END;*/

Shader "Shader Forge/MySpriteShader" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _ColorOutline ("ColorOutline", Color) = (0.5,0.5,0.5,1)
        _MarginAlpha ("MarginAlpha", Float ) = 0
        _SizeClouds ("SizeClouds", Float ) = 0
        _OutlineThickness ("OutlineThickness", Float ) = 0
        _ValueDistortB ("ValueDistortB", Float ) = 0
        _GlobalDistoForceB ("GlobalDistoForceB", Float ) = 0
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Perlin4 ("Perlin4", 2D) = "white" {}
        _PrevOutline ("PrevOutline", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
        [MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CanUseSpriteAtlas"="True"
            "PreviewType"="Plane"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #pragma multi_compile _ PIXELSNAP_ON
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            float4 Function_node_8712( float alpha1 , float alpha2 , float3 colorOutline , float3 colorBase , float marginAlpha ){
            if(alpha1>=marginAlpha&&alpha2<marginAlpha)
            {
            return(float4(colorOutline.x,colorOutline.y,colorOutline.z,alpha1));
            }
            else
            {
            return(float4(colorBase.x,colorBase.y,colorBase.z,alpha2));
            }
            }
            
            uniform float4 _ColorOutline;
            uniform float _MarginAlpha;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _SizeClouds;
            uniform float _OutlineThickness;
            uniform float _ValueDistortB;
            uniform float _GlobalDistoForceB;
            uniform sampler2D _Perlin4; uniform float4 _Perlin4_ST;
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform float _PrevOutline;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                #ifdef PIXELSNAP_ON
                    o.pos = UnityPixelSnap(o.pos);
                #endif
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
/////// Vectors:
////// Lighting:
////// Emissive:
                float node_4149 = 0.0;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_1320 = 0.5;
                float node_543 = (atan2((float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).g-node_1320),(float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).r-node_1320))+_ValueDistortB);
                float node_139 = (distance(float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg,float2(0.5,0.5))*2.0);
                float2 node_2204 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+(float2(cos(node_543),sin(node_543))*node_139*cos(((1.0 - saturate(node_139))*3.141592654*0.5))*_GlobalDistoForceB));
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(node_2204, _Perlin4));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg, _Perlin3));
                float node_5060 = (_Perlin4_var.r+_Perlin3_var.r);
                float node_4257 = (_SizeClouds+max((_OutlineThickness*0.01),0.0));
                float node_8401_if_leA = step(node_5060,(node_4257+_PrevOutline));
                float node_8401_if_leB = step((node_4257+_PrevOutline),node_5060);
                float node_665 = 1.0;
                float node_7480 = 0.0;
                float node_5979 = 2.0;
                float node_720_if_leA = step(node_5060,node_4257);
                float node_720_if_leB = step(node_4257,node_5060);
                float node_8544 = 2.0;
                float4 node_2434 = Function_node_8712( lerp(node_4149,_MainTex_var.a,saturate(floor(lerp((node_8401_if_leA*node_665)+(node_8401_if_leB*node_7480),node_7480,node_8401_if_leA*node_8401_if_leB) * node_5979) / (node_5979 - 1))) , lerp(node_4149,_MainTex_var.a,saturate(floor(lerp((node_720_if_leA*node_665)+(node_720_if_leB*node_7480),node_7480,node_720_if_leA*node_720_if_leB) * node_8544) / (node_8544 - 1))) , _ColorOutline.rgb , _MainTex_var.rgb , _MarginAlpha ).rgba;
                float node_603 = (node_2434.a*_Color.a); // A
                float3 emissive = (node_2434.rgb*_Color.rgb*node_603);
                float3 finalColor = emissive;
                return fixed4(finalColor,node_603);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
