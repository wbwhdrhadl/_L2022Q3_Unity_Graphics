Shader "Custom/Venus"
{
        Properties
        {
            _Color("Color", Color) = (1,1,0,1)
        }
            SubShader
        {
            Tags { "RenderType" = "Opaque" }
            CGPROGRAM

            #pragma surface surf Standard fullforwardshadows

            sampler2D _MainTex;

            struct Input
            {
                float2 uv_MainTex;
            };


            void surf(Input IN, inout SurfaceOutputStandard o)
            {
                // Albedo comes from a texture tinted by color
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex + _Time.y);
                o.Albedo = c.rgb;
                o.Emission = IN.uv_MainTex.y;
                o.Alpha = c.a;
            }
            ENDCG
        }
            FallBack "Diffuse"
    }
