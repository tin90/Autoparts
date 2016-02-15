package com.autoparts.groupware.tiles;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.TilesApplicationContext;
import org.apache.tiles.context.TilesRequestContextFactory;
import org.apache.tiles.factory.BasicTilesContainerFactory;

public class TilesContainerFactory extends BasicTilesContainerFactory {

	@Override
	protected List<URL> getSourceURLs(TilesApplicationContext arg0, TilesRequestContextFactory arg1) {
		List<URL> urls = new ArrayList<URL>();
        try {
        	urls.add(arg0.getResource("/WEB-INF/tiles-defs.xml"));
        } catch (IOException e) {
        }
        return urls;
	}
	
}
