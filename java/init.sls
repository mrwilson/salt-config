java-packages:
  pkg.installed:
    - names:
      - openjdk-7-jdk
      - openjdk-7-jre
    
maven-setup:
  pkg.installed:
    - names:
      - maven
  file.managed:
    - name: /home/mrwilson/.m2/settings.xml
    - source: salt://dotfiles/maven-settings.xml
    - mode: 644
    - require:
      - pkg: maven
