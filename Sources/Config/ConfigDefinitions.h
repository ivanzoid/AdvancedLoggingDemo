//
//  Created by Ivan Zezyulya on 18.03.14.
//  Copyright (c) 2014 aldigit. All rights reserved.
//

#if DEBUG
    #define ConfigVarWithProductionValue(type, name, productionValue) extern type name;
    #define ConfigVarImplWithDefaultDevelValue(type, name, develValue) type name = develValue;
#else
    #define ConfigVarWithProductionValue(type, name, productionValue) static type const name = productionValue;
    #define ConfigVarImplWithDefaultDevelValue(type, name, develValue)
#endif
