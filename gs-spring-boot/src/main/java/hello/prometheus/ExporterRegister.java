package hello.prometheus;

import io.prometheus.client.Collector;

import java.util.List;

/**
 * Metric exporter register bean to register a list of exporters to the default
 * registry
 */
public class ExporterRegister {

    private List<Collector> collectors;

    public ExporterRegister(List<Collector> collectors) {
        for (Collector collector : collectors) {
            collector.register();
        }
        this.collectors = collectors;
    }

    public List<Collector> getCollectors() {
        return collectors;
    }
}
