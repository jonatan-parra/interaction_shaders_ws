#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;
varying vec3 cameraDirection;
varying vec3 lightDirectionReflected;

void main() {
  vec3 direction = normalize(lightDirectionReflected);
  vec3 camera = normalize(cameraDirection);
  float intensity = max(0.0, dot(direction, camera));
  vec4 tintColor = vec4(intensity, intensity, intensity, 1) * vertColor;
  gl_FragColor = texture2D(texture, vertTexCoord.st) * tintColor;
}