#ifndef LUCES2_INCLUDED
#define LUCES2_INCLUDED

//#include "Assets/Ejercicio4Agua/My project/Assets/Shaders/Luces.hlsl"
void GetAdditionalLight_float(float3 worldPosition, out float3 direction, out half3 color){
    #if defined(SHADERGRAPH_PREVIEW)
        direction = float3(1,1,-1);
        color = 1;
    #else
        int pixelLightCount = GetAdditionalLightsCount();
        for (int i = 0; i < pixelLightCount; i++) {
            Light light = GetAdditionalLight(i, worldPosition);
            direction += light.direction;
            color += light.color;
        }
    #endif
}

#endif
