{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "labels" -}}
helm.sh/chart: {{ include "chart" . }}
{{ include "selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
docker registry
*/}}
{{- define "devops-app.dockerRegistry" -}}
{{- if eq .Values.image.registry "" -}}
  {{- .Values.image.registry -}}
{{- else -}}
  {{- .Values.image.registry | trimSuffix "/" | printf "%s/" -}}
{{- end -}}
{{- end -}}
