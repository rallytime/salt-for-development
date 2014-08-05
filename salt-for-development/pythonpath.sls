include:
  - salt-for-development

# Append python path to bashrc file and source it
pythonpath:
  file.append:
    - name: /home/dev-user/.bashrc
    - text:
      - export PYTHONPATH=/home/dev-user/SaltStack/salt/:/home/dev-user/SaltStack/salt-testing
      - export PATH=$PATH:/home/dev-user/SaltStack/salt/scripts/:/home/dev-user/SaltStack/salt/tests/
    - require:
      - git: rallytime_salt
      - git: rallytime_salt_testing
  cmd.run:
    - name: source /home/dev-user/.bashrc
    - require:
      - file: pythonpath
