# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# preserve the line number information for debugging stack traces.
-dontobfuscate
-keepattributes LocalVariableTable
-keepattributes LocalVariableTypeTable
-keepattributes *Annotation*
-keepattributes SourceFile
-keepattributes LineNumberTable
-keepattributes Signature
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes EnclosingMethod
-keepattributes MethodParameters
-keepparameternames

-keepdirectories libs

# Keep all names
-keepnames class ** { *; }

# Keep All enums
-keep enum ** { *; }

# preserve access to native classses
-keep class fr.acinq.secp256k1.** { *; }

# JNA For Libsodium
-keep class com.goterl.lazysodium.** { *; }

# JNA also requires AWT, which Android does not have. So the classes are broken down to filter AWT out
-keep class com.sun.jna.ToNativeConverter { *; }
-keep class com.sun.jna.NativeMapped { *; }
-keep class com.sun.jna.CallbackReference { *; }
-keep class com.sun.jna.ptr.IntByReference { *; }
-keep class com.sun.jna.NativeLong { *; }
-keep class com.sun.jna.Structure { *; }
-keep class com.sun.jna.Structure$* { *; }
-keep class com.sun.jna.Native$ffi_callback { *; }
-keep class * implements com.sun.jna.Structure$* { *; }
-keep class * implements com.sun.jna.Native$* { *; }
-keep class com.sun.jna.Native {
    private static com.sun.jna.NativeMapped fromNative(java.lang.Class, java.lang.Object);
    private static com.sun.jna.NativeMapped fromNative(java.lang.reflect.Method, java.lang.Object);
    private static java.lang.Class nativeType(java.lang.Class);
    private static java.lang.Object toNative(com.sun.jna.ToNativeConverter, java.lang.Object);
    private static java.lang.Object fromNative(com.sun.jna.FromNativeConverter, java.lang.Object, java.lang.reflect.Method);
}

# GSON parsing
-keep class com.vitorpamplona.amethyst.service.model.** { *; }
-keep class com.vitorpamplona.amethyst.model.** { *; }
-keep class com.vitorpamplona.amethyst.service.** { *; }

# Prevent proguard from stripping interface information from TypeAdapter, TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# Retain generic signatures of TypeToken and its subclasses with R8 version 3.0 and higher.
-keep,allowobfuscation,allowshrinking class com.google.gson.reflect.TypeToken
-keep,allowobfuscation,allowshrinking class * extends com.google.gson.reflect.TypeToken
