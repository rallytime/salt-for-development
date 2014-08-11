include:
  - salt-for-development

# Install salt testing requirements 
testing_requirements:
  pip.installed:
    - requirements: /home/dev-user/SaltStack/salt/dev_requirements_python27.txt
    - require:
      - pkg: python-pip
      - git: salt