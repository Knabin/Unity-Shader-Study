Shader "Custom/FireEnd"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _Noise("찌그러짐", Range(0, 10)) = 1
        _Speed("속도", Range(0, 10)) = 1
        _Bright("밝기", Range(0, 10)) = 1
    }
    SubShader
    {
        // 해당 방법은 최적화에 치명적이기 때문에 공부용으로만 사용하자!
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }

        CGPROGRAM
        #pragma surface surf Standard alpha:fade

        sampler2D _MainTex;
        sampler2D _MainTex2;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        float _Noise;
        float _Speed;
        float _Bright;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 fPos = float2(0, - _Time.y * _Speed);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2 + fPos);
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex + d.r * _Noise);

            o.Emission = c.rgb * _Bright;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
