/****************************************************************************
** Meta object code from reading C++ file 'EigenGraspPlanner.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../src/graspit-pkgs/grasp_planning_graspit/include/grasp_planning_graspit/EigenGraspPlanner.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'EigenGraspPlanner.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_GraspIt__EigenGraspPlanner[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      28,   27,   27,   27, 0x0a,
      48,   27,   27,   27, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_GraspIt__EigenGraspPlanner[] = {
    "GraspIt::EigenGraspPlanner\0\0"
    "plannerUpdateSlot()\0plannerCompleteSlot()\0"
};

void GraspIt::EigenGraspPlanner::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        EigenGraspPlanner *_t = static_cast<EigenGraspPlanner *>(_o);
        switch (_id) {
        case 0: _t->plannerUpdateSlot(); break;
        case 1: _t->plannerCompleteSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData GraspIt::EigenGraspPlanner::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GraspIt::EigenGraspPlanner::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_GraspIt__EigenGraspPlanner,
      qt_meta_data_GraspIt__EigenGraspPlanner, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GraspIt::EigenGraspPlanner::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GraspIt::EigenGraspPlanner::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GraspIt::EigenGraspPlanner::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GraspIt__EigenGraspPlanner))
        return static_cast<void*>(const_cast< EigenGraspPlanner*>(this));
    if (!strcmp(_clname, "GraspItAccessor"))
        return static_cast< GraspItAccessor*>(const_cast< EigenGraspPlanner*>(this));
    return QObject::qt_metacast(_clname);
}

int GraspIt::EigenGraspPlanner::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
