 # MicroProfile Healt Check

## Introducción

>Una guía rápida para la implementación de Health Checks en tu proyecto. Se utiliza para sondear el estado de un nodo desde otra máquina (es decir, el controlador de servicio kubernetes) apuntando principalmente a entornos de infraestructura en la nube, donde los procesos automatizados mantienen el estado de los nodos.

## Requisitos

> - Proyecto Java EE - Maven
> - Payara/Micro (5.182)
> - Docker

## Forma de uso

### Añadir dependencias de MicroProfile Health Check al .POM

    <dependency>
            <groupId>org.eclipse.microprofile</groupId>
            <artifactId>microprofile</artifactId>
            <version>1.3</version>
            <type>pom</type>
            <scope>provided</scope>
    </dependency>
    
### Agregar a los recursos las notaciones necesarias para la implementación

    @Health
    @ApplicationScoped
    @Path("marca")
    public class MarcaResource implements HealthCheck {
    
    [...]

    @Override
       public HealthCheckResponse call() {
         return HealthCheckResponse.named("successful-check").withData("mantenimiento", "marca").up().build();
       }
    }

