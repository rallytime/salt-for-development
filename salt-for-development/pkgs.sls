include:
  - salt-for-development

{% if grains['os'] == 'Arch' %}
  {% set pip = 'python2-pip' %}
{% else %}
  {% set pip = 'python-pip' %}
{% endif %}

{% if grains['os_family'] == 'RedHat' %}
  {% set vim = 'vim-enhanced' %}
{% else %}
  {% set vim = 'vim' %}
{% endif %}

# Install pip
python-pip:
  pkg.installed:
    - name: {{ pip }}

# Insall vim
vim:
  pkg.installed:
    - name: {{ vim }}

# Make sure git is installed
git:
  pkg.installed:
    - name: git
    - require_in:
      - git: config_name
      - git: config_email
