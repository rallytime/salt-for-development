include:
  - salt-for-development

{% if grains['os'] == 'Arch' %}
  {% set pip = 'python2-pip' %}
{% else %}
  {% set pip = 'python-pip' %}
{% endif %}

# Install pip
python-pip:
  pkg.installed:
    - name: {{ pip }}

# Make sure git is installed
git:
  pkg.installed:
    - name: git
    - require_in:
      - git: config_name
      - git: config_email