{#- Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-#}

{%- macro stage(source_model, hashed_columns, derived_columns) -%}
-- Generated by dbtvault.
SELECT

{% if (hashed_columns is defined and hashed_columns) -%}

    {{ dbtvault.hash_columns(hashed_columns) -}}

    {{ "," if derived_columns is defined and source_model is defined }}

{% endif -%}

{%- if derived_columns is defined -%}

    {% if derived_columns['include_source'] -%}

    {{ dbtvault.derive_columns(source_model=ref(source_model), columns=derived_columns['columns']) }}
    {%- else -%}

    {{ dbtvault.derive_columns(columns=derived_columns['columns']) }}
    {%- endif %}
{%- elif source_model is defined -%}

    {{ dbtvault.derive_columns(source_model=ref(source_model)) }}

{%- endif %}

FROM {{ ref(source_model) }}
{%- endmacro -%}