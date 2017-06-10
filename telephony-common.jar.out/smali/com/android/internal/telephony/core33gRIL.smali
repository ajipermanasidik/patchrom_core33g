.class public Lcom/android/internal/telephony/core33gRIL;
.super Lcom/android/internal/telephony/SamsungSPRDRIL;
.source "core33gRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/core33gRIL$TelephonyPropertyProvider;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/core33gRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    .line 113
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/SamsungSPRDRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 112
    return-void
.end method


# virtual methods
.method public getHardwareConfig(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 120
    const-string/jumbo v1, "Ignoring call to \'getHardwareConfig\'"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/core33gRIL;->riljLog(Ljava/lang/String;)V

    .line 121
    if-eqz p1, :cond_0

    .line 122
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 123
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 122
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 124
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p1, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 125
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 119
    .end local v0    # "ex":Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 17
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 147
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    .line 148
    .local v8, "num":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 155
    .local v9, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v8, :cond_7

    .line 156
    new-instance v4, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v4}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .line 158
    .local v4, "dc":Lcom/android/internal/telephony/DriverCall;
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    invoke-static {v13}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v13

    iput-object v13, v4, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 160
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    and-int/lit16 v13, v13, 0xff

    iput v13, v4, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 161
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    iput v13, v4, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 162
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_0

    const/4 v13, 0x1

    :goto_1
    iput-boolean v13, v4, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 163
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_1

    const/4 v13, 0x1

    :goto_2
    iput-boolean v13, v4, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 164
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    iput v13, v4, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 165
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    .line 166
    .local v12, "voiceSettings":I
    if-eqz v12, :cond_2

    const/4 v13, 0x1

    :goto_3
    iput-boolean v13, v4, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 167
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_3

    const/4 v6, 0x1

    .line 168
    .local v6, "isVideo":Z
    :goto_4
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 169
    .local v2, "call_type":I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 170
    .local v1, "call_domain":I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 171
    .local v3, "csv":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_4

    const/4 v13, 0x1

    :goto_5
    iput-boolean v13, v4, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 172
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v4, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 173
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 174
    .local v7, "np":I
    invoke-static {v7}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v13

    iput v13, v4, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 175
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v4, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 176
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    iput v13, v4, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 177
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    .line 178
    .local v11, "uusInfoPresent":I
    const/4 v13, 0x1

    if-ne v11, v13, :cond_5

    .line 179
    new-instance v13, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v13}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v13, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 180
    iget-object v13, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v14

    invoke-virtual {v13, v14}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 181
    iget-object v13, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v14

    invoke-virtual {v13, v14}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 182
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v10

    .line 183
    .local v10, "userData":[B
    iget-object v13, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13, v10}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 184
    const-string/jumbo v13, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    .line 185
    iget-object v15, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v15}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x0

    aput-object v15, v14, v16

    iget-object v15, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v15}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x1

    aput-object v15, v14, v16

    .line 186
    iget-object v15, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v15}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v15

    array-length v15, v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x2

    aput-object v15, v14, v16

    .line 184
    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLogv(Ljava/lang/String;)V

    .line 187
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Incoming UUS : data (string)="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 188
    new-instance v14, Ljava/lang/String;

    iget-object v15, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v15}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/String;-><init>([B)V

    .line 187
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLogv(Ljava/lang/String;)V

    .line 189
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Incoming UUS : data (hex): "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 190
    iget-object v14, v4, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v14}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v14

    invoke-static {v14}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v14

    .line 189
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLogv(Ljava/lang/String;)V

    .line 196
    .end local v10    # "userData":[B
    :goto_6
    iget-object v13, v4, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v14, v4, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v13, v14}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v4, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 198
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    iget-boolean v13, v4, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v13, :cond_6

    .line 201
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/core33gRIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v13}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 202
    const-string/jumbo v13, "InCall VoicePrivacy is enabled"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLog(Ljava/lang/String;)V

    .line 155
    :goto_7
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 162
    .end local v1    # "call_domain":I
    .end local v2    # "call_type":I
    .end local v3    # "csv":Ljava/lang/String;
    .end local v6    # "isVideo":Z
    .end local v7    # "np":I
    .end local v11    # "uusInfoPresent":I
    .end local v12    # "voiceSettings":I
    :cond_0
    const/4 v13, 0x0

    goto/16 :goto_1

    .line 163
    :cond_1
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 166
    .restart local v12    # "voiceSettings":I
    :cond_2
    const/4 v13, 0x0

    goto/16 :goto_3

    .line 167
    :cond_3
    const/4 v6, 0x0

    .restart local v6    # "isVideo":Z
    goto/16 :goto_4

    .line 171
    .restart local v1    # "call_domain":I
    .restart local v2    # "call_type":I
    .restart local v3    # "csv":Ljava/lang/String;
    :cond_4
    const/4 v13, 0x0

    goto/16 :goto_5

    .line 192
    .restart local v7    # "np":I
    .restart local v11    # "uusInfoPresent":I
    :cond_5
    const-string/jumbo v13, "Incoming UUS : NOT present!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLogv(Ljava/lang/String;)V

    goto :goto_6

    .line 204
    :cond_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/core33gRIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v13}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 205
    const-string/jumbo v13, "InCall VoicePrivacy is disabled"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_7

    .line 209
    .end local v1    # "call_domain":I
    .end local v2    # "call_type":I
    .end local v3    # "csv":Ljava/lang/String;
    .end local v4    # "dc":Lcom/android/internal/telephony/DriverCall;
    .end local v6    # "isVideo":Z
    .end local v7    # "np":I
    .end local v11    # "uusInfoPresent":I
    .end local v12    # "voiceSettings":I
    :cond_7
    invoke-static {v9}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 211
    if-nez v8, :cond_8

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/core33gRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 212
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/core33gRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v13, :cond_8

    .line 213
    const-string/jumbo v13, "responseCallList: call ended, testing emergency call, notify ECM Registrants"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/android/internal/telephony/core33gRIL;->riljLog(Ljava/lang/String;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/core33gRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v13}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 219
    :cond_8
    return-object v9
.end method

.method public startLceService(IZLandroid/os/Message;)V
    .locals 3
    .param p1, "reportIntervalMs"    # I
    .param p2, "pullMode"    # Z
    .param p3, "response"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 131
    const-string/jumbo v0, "Link Capacity Estimate (LCE) service is not supported!"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/core33gRIL;->riljLog(Ljava/lang/String;)V

    .line 132
    if-eqz p3, :cond_0

    .line 133
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 134
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 133
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    invoke-static {p3, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 135
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 130
    :cond_0
    return-void
.end method
