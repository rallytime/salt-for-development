include:
  - salt-for-development

{% if grains['os'] == 'Arch' %}
  {% set pip = 'python2-pip' %}
{% else %}
  {% set pip = 'python-pip' %}
{% endif %}

python-pip:
  pkg.installed:
    - name: {{ pip }}

testing_requirements:
  pip.installed:
    - requirements: /home/dev-user/SaltStack/salt/dev_requirements_python27.txt
    - require:
      - pkg: python-pip
      - git: rallytime_salt
