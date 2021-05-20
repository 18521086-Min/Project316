from keras.models import load_model
import h5py
import numpy as np
import os

f = h5py.File('vgg16_weights.h5')
model = load_model('vgg16-digitRecognizer_keras.h5')

print(list(f.keys()))
print(model)
print(f['conv1'].keys())
# print(list(f.attrs.items()))
# print(list(f.items()))
for key, value in f.attrs.items():           
    print("  {}: {}".format(key, value))


# print(f['conv1']['bias:0'])

print("  layer, g in f.items():")
for layer, g in f.items():        

    ## MAKE DIRECT    
    print((format(layer)))
    os.mkdir('./weight/' + format(layer))

    # print("    g.attrs.items(): Attributes:")
    # for key, value in g.attrs.items():
    #     print("      {}: {}".format(key, value))

#     print("    Dataset:")
    for p_name in g.keys():


        ## SAVE BIAS
        print(g[p_name].get('bias:0')[:])
        np.savetxt('./weight/' + format(layer) + '/' + format(layer) + '_ bias.txt', g[p_name].get('bias:0')[:])


        
        ## SAVE KERNEL (OR FILTER)
        shap = g[p_name].get('kernel:0').shape
        print(shap)
        # print(g[p_name].get('kernel:0')[0][0][:][0])
        # print(g[p_name].get('kernel:0')[:])
        if (format(layer).find('conv')==0):
            for _ in range (shap[2]):
                for x in range (shap[0]):
                    for y in range (shap[1]):
                        np.savetxt('./weight/' +  format(layer) + '/' + format(layer) + '_ kernel' + str(_) + '_W' + str(x*3+y) + '.txt', g[p_name].get('kernel:0')[x][y][_][:])
        elif (format(layer).find('fc')==0):
            np.savetxt('./weight/' +  format(layer) + '/' + format(layer) + '_ kernel.txt', g[p_name].get('kernel:0')[:])
        

            # for i in range (3):
            #     if (i==0):
            #         np.savetxt('./weight/' + format(layer) + '_ kernel0.txt', g[p_name].get('kernel:0')[0][:])
            #     if (i==1):
            #         np.savetxt('./weight/' + format(layer) + '_ kernel1.txt', g[p_name].get('kernel:0')[2][:])
            #     if (i==2):
            #         np.savetxt('./weight/' + format(layer) + '_ kernel2.txt', g[p_name].get('kernel:0')[2][:])
        # np.savetxt('./weight/' + format(layer) + '_ kernel.txt', g[p_name].get('kernel:0')[:])
        # param = g[p_name]
        # subkeys = param.keys()
        # print("    Dataset: param.keys():")
        # for k_name in param.keys():s
        #     print("      {}/{}: {}".format(p_name, k_name, param.get(k_name)[:]))

# print(len(model.layers[1].get_weights()[0][0][0]))

# print((model.layers[2].get_weights()[0][0][1]))
f.close()
