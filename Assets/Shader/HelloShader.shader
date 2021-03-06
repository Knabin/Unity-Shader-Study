// 셰이더의 이름
Shader "Custom/Hello"
{
    Properties
    {
        fR("Red", Range(0, 1)) = 1.0
        fG("Green", Range(0, 1)) = 0.0
        fB("Blue", Range(0, 1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        float fR;
        float fG;
        float fB;

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Emission = float3(fR, fG, fB);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
