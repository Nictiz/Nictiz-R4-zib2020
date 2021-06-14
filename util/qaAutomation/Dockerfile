FROM ubuntu:20.10
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install openjdk-11-jre-headless
RUN apt-get -y install git
RUN apt-get -y install python3 python3-yaml
RUN apt-get -y install nodejs npm
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb
RUN apt-get update && apt-get -y install apt-transport-https && apt-get -y install dotnet-sdk-3.1 

RUN mkdir /tools
RUN mkdir /input
RUN mkdir /output

RUN mkdir tools/validator
RUN wget -nv https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -O tools/validator/validator.jar
RUN java -jar /tools/validator/validator.jar -version 4.0 -fhirpath "'Seems like a failure, but we just created a package cache'" | cat

RUN dotnet tool install -g --version 2.0.0 firely.terminal
RUN ~/.dotnet/tools/fhir install hl7.fhir.r4.core 4.0.1

RUN git clone -b action --depth 1 https://github.com/pieter-edelman-nictiz/zib-compliance-fhir.git /tools/zib-compliance-fhir
RUN cd tools/zib-compliance-fhir && npm install && cd /

RUN git clone -b v0.15 --depth 1 https://github.com/pieter-edelman-nictiz/hl7-fhir-validator-action /tools/hl7-fhir-validator-action

RUN apt-get -y install dos2unix
RUN mkdir /scripts
COPY getresources.sh /scripts/getresources.sh
COPY checktx.sh /scripts/checktx.sh
COPY mkprofilingig.sh /scripts/mkprofilingig.sh
COPY generatezibsnapshots.sh /scripts/generatezibsnapshots.sh
COPY entrypoint.sh entrypoint.sh
RUN chmod +x *.sh
RUN chmod +x /scripts/*.sh
RUN dos2unix /scripts/getresources.sh /scripts/checktx.sh /scripts/mkprofilingig.sh /scripts/generatezibsnapshots.sh entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
