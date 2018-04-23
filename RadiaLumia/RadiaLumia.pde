/** 
 * By using LX Studio, you agree to the terms of the LX Studio Software
 * License and Distribution Agreement, available at: http://lx.studio/license
 *
 * Please note that the LX license is not open-source. The license
 * allows for free, non-commercial use.
 *
 * HERON ARTS MAKES NO WARRANTY, EXPRESS, IMPLIED, STATUTORY, OR
 * OTHERWISE, AND SPECIFICALLY DISCLAIMS ANY WARRANTY OF
 * MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR
 * PURPOSE, WITH RESPECT TO THE SOFTWARE.
 */

// ---------------------------------------------------------------------------
//
// Welcome to LX Studio! Getting started is easy...
// 
// (1) Quickly scan this file
// (2) Look at "Model" to define your model
// (3) Move on to "Patterns" to write your animations
// 
// ---------------------------------------------------------------------------

// Reference to top-level LX instance
heronarts.lx.studio.LXStudio lx;

Config config;
Model model;
SingletonUmbrellaUpdater umbrellaUpdater;
UIRadiaLumia umbrellaModel;

void setup() {
  // Processing setup, constructs the window and the LX instance
  size(800, 720, P3D);
  config = new Config();
  model = new Model(config);
  
  lx = new heronarts.lx.studio.LXStudio(this, model, MULTITHREADED);
  lx.ui.setResizable(RESIZABLE);
}

void initialize(heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  // Add custom components or output drivers here
  try {
    LXDatagramOutput output = new LXDatagramOutput(lx);
    
    // TODO: construct appropriate StreamingACNDatagram for each bloom
    for (Bloom bloom : model.blooms) {
      // Config data from JSON...
      JSONObject bloomConfig = config.getBloom(bloom.index);
    }
    
    
    lx.engine.addOutput(output);
  } catch (Exception x) {
    throw new RuntimeException(x);
  }
}

void onUIReady(heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  // Add custom UI components here
  ui.preview.addComponent(new UISimulation());
}

void draw() {
  // All is handled by LX Studio
}

// Configuration flags
final static boolean MULTITHREADED = true;
final static boolean RESIZABLE = true;

// Helpful global constants
final static float INCHES = 1;
final static float IN = INCHES;
final static float FEET = 12 * INCHES;
final static float FT = FEET;
final static float CM = 2.54 * IN;
final static float MM = CM * .1;
final static float M = CM * 00;
