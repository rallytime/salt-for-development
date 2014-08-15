include:
  - salt-for-development

{% if grains['os'] == 'Arch' %}
  {% set pip = 'python2-pip' %}
{% else %}
  {% set pip = 'python-pip' %}
{% endif %}

{% if grains['os_family'] == 'Debian' %}
python-apt:
  pkg.installed:
    - name: python-apt
    - require_in:
      - pkg: vim
      - pkg: python-pip
      - pkg: git
{% endif %}

# Install pip
python-pip:
  pkg.installed:
    - name: {{ pip }}

# Insall vim
vim:
  pkg.installed:
    - name: vim

# Make sure git is installed
git:
  pkg.installed:
    - name: git
    - require_in:
      - git: config_name
      - git: config_email