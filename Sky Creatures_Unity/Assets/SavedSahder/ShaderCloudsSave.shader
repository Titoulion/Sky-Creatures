// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:35773,y:32660,varname:node_3138,prsc:2|emission-2051-OUT,alpha-8862-OUT;n:type:ShaderForge.SFN_Tex2d,id:9493,x:33310,y:33426,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_9493,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7042-OUT;n:type:ShaderForge.SFN_Tex2d,id:9656,x:33353,y:33122,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_9656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:2819,x:33706,y:33150,varname:node_2819,prsc:2|A-9656-R,B-9493-R;n:type:ShaderForge.SFN_If,id:2051,x:34603,y:32423,varname:node_2051,prsc:2|A-2819-OUT,B-5611-OUT,GT-700-OUT,EQ-700-OUT,LT-459-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5611,x:33978,y:33388,ptovrint:False,ptlb:SizeClouds,ptin:_SizeClouds,varname:node_5611,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9255,x:33480,y:32442,ptovrint:False,ptlb:TexturePen,ptin:_TexturePen,varname:node_9255,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_If,id:8862,x:34585,y:33427,varname:node_8862,prsc:2|A-2819-OUT,B-6080-OUT,GT-5298-OUT,EQ-5298-OUT,LT-4293-OUT;n:type:ShaderForge.SFN_Add,id:6080,x:34221,y:33403,varname:node_6080,prsc:2|A-5611-OUT,B-9357-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7942,x:33713,y:33578,ptovrint:False,ptlb:OutlineThickness,ptin:_OutlineThickness,varname:node_7942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:5298,x:34388,y:33501,varname:node_5298,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4293,x:34420,y:33591,varname:node_4293,prsc:2,v1:1;n:type:ShaderForge.SFN_Posterize,id:7612,x:33651,y:32766,varname:node_7612,prsc:2|IN-2819-OUT,STPS-3183-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3183,x:33382,y:32916,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_3183,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:459,x:34301,y:32551,varname:node_459,prsc:2|A-8369-RGB,B-9897-RGB,T-9274-OUT;n:type:ShaderForge.SFN_Color,id:8369,x:33962,y:32604,ptovrint:False,ptlb:node_8369,ptin:_node_8369,varname:node_8369,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:9897,x:33962,y:32771,ptovrint:False,ptlb:node_9897,ptin:_node_9897,varname:node_9897,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Clamp01,id:9274,x:33737,y:32576,varname:node_9274,prsc:2|IN-7612-OUT;n:type:ShaderForge.SFN_Lerp,id:700,x:34177,y:32275,varname:node_700,prsc:2|A-7834-RGB,B-2950-RGB,T-9255-R;n:type:ShaderForge.SFN_Color,id:7834,x:34018,y:32142,ptovrint:False,ptlb:node_7834,ptin:_node_7834,varname:node_7834,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:2950,x:34211,y:32135,ptovrint:False,ptlb:node_2950,ptin:_node_2950,varname:node_2950,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:600,x:31660,y:32948,varname:node_600,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:8484,x:31773,y:33198,varname:node_8484,prsc:2|A-600-UVOUT,B-3131-OUT;n:type:ShaderForge.SFN_Vector2,id:3131,x:31527,y:33243,varname:node_3131,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:5939,x:31843,y:33521,varname:node_5939,prsc:2|A-8484-OUT,B-1995-OUT;n:type:ShaderForge.SFN_Vector1,id:1995,x:31579,y:33501,varname:node_1995,prsc:2,v1:2;n:type:ShaderForge.SFN_ArcTan2,id:1467,x:32455,y:32413,varname:node_1467,prsc:2|A-8994-OUT,B-9046-OUT;n:type:ShaderForge.SFN_Subtract,id:8994,x:32074,y:32451,varname:node_8994,prsc:2|A-600-V,B-8494-OUT;n:type:ShaderForge.SFN_Vector1,id:8494,x:32278,y:32508,varname:node_8494,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:9046,x:32280,y:32392,varname:node_9046,prsc:2|A-600-U,B-8494-OUT;n:type:ShaderForge.SFN_Cos,id:4234,x:32809,y:32218,varname:node_4234,prsc:2|IN-3554-OUT;n:type:ShaderForge.SFN_Sin,id:4412,x:32809,y:32448,varname:node_4412,prsc:2|IN-3554-OUT;n:type:ShaderForge.SFN_Append,id:310,x:33179,y:32586,varname:node_310,prsc:2|A-4234-OUT,B-4412-OUT;n:type:ShaderForge.SFN_Add,id:3554,x:32648,y:32467,varname:node_3554,prsc:2|A-1467-OUT,B-750-OUT;n:type:ShaderForge.SFN_Pi,id:9766,x:32488,y:32619,varname:node_9766,prsc:2;n:type:ShaderForge.SFN_Multiply,id:750,x:32720,y:32665,varname:node_750,prsc:2|A-9766-OUT,B-369-OUT;n:type:ShaderForge.SFN_Multiply,id:5528,x:32255,y:32895,varname:node_5528,prsc:2|A-310-OUT,B-8484-OUT,C-4917-OUT,D-2292-OUT;n:type:ShaderForge.SFN_Add,id:7042,x:33072,y:33169,varname:node_7042,prsc:2|A-600-UVOUT,B-5528-OUT;n:type:ShaderForge.SFN_ValueProperty,id:369,x:32488,y:32744,ptovrint:False,ptlb:ValueDistort,ptin:_ValueDistort,varname:node_369,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2292,x:32375,y:33280,ptovrint:False,ptlb:GlobalDistoForce,ptin:_GlobalDistoForce,varname:node_2292,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:8774,x:32021,y:33475,varname:node_8774,prsc:2|IN-5939-OUT;n:type:ShaderForge.SFN_Sin,id:9504,x:32529,y:33454,varname:node_9504,prsc:2|IN-9270-OUT;n:type:ShaderForge.SFN_Pi,id:6424,x:32123,y:33817,varname:node_6424,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9270,x:32485,y:33671,varname:node_9270,prsc:2|A-1279-OUT,B-6424-OUT,C-7740-OUT;n:type:ShaderForge.SFN_Vector1,id:7740,x:32598,y:33810,varname:node_7740,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:1279,x:32176,y:33513,varname:node_1279,prsc:2|IN-8774-OUT;n:type:ShaderForge.SFN_Cos,id:4917,x:32654,y:33569,varname:node_4917,prsc:2|IN-9270-OUT;n:type:ShaderForge.SFN_Multiply,id:6167,x:34000,y:33627,varname:node_6167,prsc:2|A-7942-OUT,B-9838-OUT;n:type:ShaderForge.SFN_Vector1,id:9838,x:33768,y:33671,varname:node_9838,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Max,id:9357,x:34145,y:33662,varname:node_9357,prsc:2|A-6167-OUT,B-4717-OUT;n:type:ShaderForge.SFN_Vector1,id:4717,x:34077,y:33748,varname:node_4717,prsc:2,v1:0;proporder:9493-9656-3183-9255-7942-5611-8369-9897-7834-2950-369-2292;pass:END;sub:END;*/

Shader "Shader Forge/ShaderClouds" {
    Properties {
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Perlin4 ("Perlin4", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Float ) = 0
        _TexturePen ("TexturePen", 2D) = "white" {}
        _OutlineThickness ("OutlineThickness", Float ) = 0
        _SizeClouds ("SizeClouds", Float ) = 0
        _node_8369 ("node_8369", Color) = (0.5,0.5,0.5,1)
        _node_9897 ("node_9897", Color) = (0.5,0.5,0.5,1)
        _node_7834 ("node_7834", Color) = (0.5,0.5,0.5,1)
        _node_2950 ("node_2950", Color) = (0.5,0.5,0.5,1)
        _ValueDistort ("ValueDistort", Float ) = 0
        _GlobalDistoForce ("GlobalDistoForce", Float ) = 0
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
            uniform sampler2D _TexturePen; uniform float4 _TexturePen_ST;
            uniform float _OutlineThickness;
            uniform float _PosterizeStrength;
            uniform float4 _node_8369;
            uniform float4 _node_9897;
            uniform float4 _node_7834;
            uniform float4 _node_2950;
            uniform float _ValueDistort;
            uniform float _GlobalDistoForce;
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
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(i.uv0, _Perlin4));
                float node_8494 = 0.5;
                float node_3554 = (atan2((i.uv0.g-node_8494),(i.uv0.r-node_8494))+(3.141592654*_ValueDistort));
                float node_8484 = distance(i.uv0,float2(0.5,0.5));
                float node_9270 = ((1.0 - saturate((node_8484*2.0)))*3.141592654*0.5);
                float2 node_7042 = (i.uv0+(float2(cos(node_3554),sin(node_3554))*node_8484*cos(node_9270)*_GlobalDistoForce));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(node_7042, _Perlin3));
                float node_2819 = (_Perlin4_var.r+_Perlin3_var.r);
                float node_2051_if_leA = step(node_2819,_SizeClouds);
                float node_2051_if_leB = step(_SizeClouds,node_2819);
                float4 _TexturePen_var = tex2D(_TexturePen,TRANSFORM_TEX(i.uv0, _TexturePen));
                float3 node_700 = lerp(_node_7834.rgb,_node_2950.rgb,_TexturePen_var.r);
                float3 emissive = lerp((node_2051_if_leA*lerp(_node_8369.rgb,_node_9897.rgb,saturate(floor(node_2819 * _PosterizeStrength) / (_PosterizeStrength - 1))))+(node_2051_if_leB*node_700),node_700,node_2051_if_leA*node_2051_if_leB);
                float3 finalColor = emissive;
                float node_8862_if_leA = step(node_2819,(_SizeClouds+max((_OutlineThickness*0.01),0.0)));
                float node_8862_if_leB = step((_SizeClouds+max((_OutlineThickness*0.01),0.0)),node_2819);
                float node_5298 = 0.0;
                return fixed4(finalColor,lerp((node_8862_if_leA*1.0)+(node_8862_if_leB*node_5298),node_5298,node_8862_if_leA*node_8862_if_leB));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
