---
book: games
book_order:
date: {{ time.Now | time.Format "2006-01-02" }}
draft: true
show_image: true
show_right_column: true
show_title: true
show_toc: true
backlog_statuses: []
slug: "{{ .File.ContentBaseName  }}.md"
tags: []
{{- $token := os.Getenv "IGDB_ACCESS_TOKEN" }}
{{- $client_id := os.Getenv "IGDB_CLIENT_ID" }}
{{- $igdb_id := os.Getenv "IGDB_ID" }}
{{- $opts := dict "method" "post" "headers" (dict "Client-ID" $client_id "Accept" "application/json" "Authorization" (printf "Bearer %s" $token)) "body" (printf "fields *; where id=%s;" $igdb_id) }}
{{- with try (resources.GetRemote "https://api.igdb.com/v4/games" $opts) }}
  {{- with .Err }}
    {{- errorf "%s" . }}
  {{- else with .Value }}
    {{- $game_data := . | transform.Unmarshal }}
title: "{{ (index $game_data 0).name }}"
description: "{{ (index $game_data 0).name }} journal"
references:
  - title: "{{ (index $game_data 0).name }} igdb page"
    url: {{  (index $game_data 0).url }}
igdb_id: {{ $igdb_id }}
    {{- $opts := dict
      "method" "post"
      "headers" (dict
        "Client-ID" $client_id
        "Accept" "application/json"
        "Authorization" (printf "Bearer %s" $token))
        "body" (printf "fields *; where id=(%s);" ( delimit (index $game_data 0).genres ",") ) }}
    {{- with try (resources.GetRemote "https://api.igdb.com/v4/genres" $opts) }}
      {{- with .Err }}
        {{- errorf "%s" . }}
      {{- else with .Value }}
        {{- $genres_data := . | transform.Unmarshal }}
genres:
        {{- range $genre := $genres_data }}
  - "{{ $genre.name }}"
        {{- end }}
      {{- end }}
    {{- end }}
    {{- $opts := dict
      "method" "post"
      "headers" (dict
        "Client-ID" $client_id
        "Accept" "application/json"
        "Authorization" (printf "Bearer %s" $token))
        "body" (printf "fields *; where game=%s;" $igdb_id ) }}
    {{- with try (resources.GetRemote "https://api.igdb.com/v4/covers" $opts) }}
      {{- with .Err }}
        {{- errorf "%s" . }}
      {{- else with .Value }}
        {{- $image_data := . | transform.Unmarshal }}
image: "https://images.igdb.com/igdb/image/upload/t_1080p/{{ (index $image_data 0).image_id }}.jpg"
      {{- end }}
    {{- end }}
    {{- $opts := dict
      "method" "post"
      "headers" (dict
        "Client-ID" $client_id
        "Accept" "application/json"
        "Authorization" (printf "Bearer %s" $token))
        "body" (printf "fields *; where game_id=%s;" $igdb_id ) }}
    {{- with try (resources.GetRemote "https://api.igdb.com/v4/game_time_to_beats" $opts) }}
      {{- with .Err }}
        {{- errorf "%s" . }}
      {{- else with .Value }}
        {{- $ttb_data := . | transform.Unmarshal }}
time_to_beat:
  hastily: "{{ (index $ttb_data 0).hastily }}"
  normally: "{{ (index $ttb_data 0).normally }}"
  completely: "{{ (index $ttb_data 0).completely }}"
      {{- end }}
    {{- end }}
aliases:
  - "/{{ $.File.ContentBaseName  }}"
  - "/{{ strings.Replace (printf "%s" (index $game_data 0).name ) " " "-"}}"
  - "/games/{{ $.File.ContentBaseName  }}"
  - "/games/{{ strings.Replace (printf "%s" (index $game_data 0).name ) " " "-"}}"
  {{- end }}
{{- end }}
---
